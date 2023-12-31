import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yaoji/common/net/result_data.dart';
import 'package:yaoji/common/net/response_interceptor.dart';
import 'package:yaoji/common/net/net_code.dart';

// 网络异常 The connection errored: Failed host lookup
// 解决方案：
// 1、尝试重启VSCode、删除App重新运行；
// 2、手机重启网络

final YJHttpManager httpManager = YJHttpManager();

class YJHttpManager {
  final _domain = "https://api.cbaigui.com";
  final Dio _dio = Dio();

  YJHttpManager() {
    // 注册请求数据拦截器
    _dio.interceptors.add(ResponseInterceptors());
  }

  Future<ResultData?> netFetch(
      String path, Map<String, dynamic>? params, Map<String, dynamic>? header,
      {method = "post"}) async {
    final url = "$_domain/$path";
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }
    Options options = Options(method: method ?? "post");
    options.headers = headers;

    resultError(DioException e) {
      Response? errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(
          statusCode: 666,
          requestOptions: RequestOptions(path: url),
        );
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        errorResponse!.statusCode = Code.networkTimeout;
      }
      debugPrint("请求失败: ${e.message}");
      return ResultData(e.message, false, errorResponse?.statusCode);
    }

    Response response;
    try {
      debugPrint('url: $url params: $params');
      response = await _dio.request(url, data: params, options: options);
    } on DioException catch (e) {
      return resultError(e);
    }
    if (response.data is DioException) {
      return resultError(response.data);
    }
    return response.data;
  }
}

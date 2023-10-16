import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yaoji/common/net/result_data.dart';
import 'package:yaoji/common/net/net_code.dart';

// 请求成功后数据的拦截，统一处理
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options = response.requestOptions;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if (header != null && header.toString().contains('text')) {
        value = ResultData(
          response.data,
          true,
          Code.success,
          headers: response.headers,
        );
      } else if (response.statusCode! >= 200 && response.statusCode! < 300) {
        value = ResultData(
          response.data,
          true,
          Code.success,
          headers: response.headers,
        );
      }
    } catch (e) {
      debugPrint("请求失败了：");
      debugPrint(e.toString() + options.path);
      value = ResultData(
        response.data,
        false,
        response.statusCode,
        headers: response.headers,
      );
    }
    response.data = value;
    return handler.next(response);
  }
}

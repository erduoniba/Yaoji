///错误编码
class Code {
  ///网络错误
  static const networkError = -1;

  ///网络超时
  static const networkTimeout = -2;

  static const success = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    return message;
  }
}

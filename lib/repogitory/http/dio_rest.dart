import 'package:dio/dio.dart';

class DioRest {
  static final DioRest _dioRest = DioRest._internal();
  factory DioRest() => _dioRest;
  static Dio _dio = Dio();

  DioRest._internal() {

    _dio = Dio(BaseOptions(
      baseUrl: 'https://y7sxw6t4kh.execute-api.us-east-1.amazonaws.com/portfolioApi/',
      headers: {
        // 'Accept': 'application/json',
        // 'Content-Type':'application/json',
        'Access-Control-Allow-Origin': '*',
      },
    ));
    _dio.interceptors.add(DioInterceptor());
  }

  Dio to() {
    return _dio;
  }
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {

    print("에러1");

    print("에러2");
    super.onError(err, handler);
  }
}
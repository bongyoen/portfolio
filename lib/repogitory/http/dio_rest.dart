import 'package:dio/dio.dart';

class DioRest {
  static final DioRest _dioRest = DioRest._internal();

  factory DioRest() => _dioRest;
  static Dio _dio = Dio();

  DioRest._internal() {
    BaseOptions options = BaseOptions(
      // baseUrl: 'https://api.beyoundi.link',
      baseUrl: 'http://localhost:8083',
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
      },
    );

    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Dio to() => _dio;
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
    super.onError(err, handler);
  }
}

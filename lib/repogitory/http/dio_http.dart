import 'package:dio/dio.dart';

class DioHttp {
  static final DioHttp _dioServices = DioHttp._internal();
  factory DioHttp() => _dioServices;
  Map<String, dynamic> dioInformation = {};
  static Dio _dio = Dio();

  DioHttp._internal() {

    _dio = Dio(BaseOptions(
      baseUrl: 'https://www.google.com/',
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
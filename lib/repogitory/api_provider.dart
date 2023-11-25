import 'package:dio/dio.dart';

import 'http/dio_rest.dart';

class ApiProvider {
  ApiProvider._privateConstructor();

  static final ApiProvider _instance = ApiProvider._privateConstructor();

  factory ApiProvider() => _instance;

  static final Dio _dio = DioRest().to();

  Future<Response> getInfo() => _dio.get("/info");

  Future<Response> getWebHeaders() => _dio.get("/board/webHeaders");

  Future<Response> getPortfolioInfo() => _dio.get("/board/portfolioInfo");

  Future<Response> getAboutMe() => _dio.get("/board/aboutMe");

  Future<Response> getCarrer() => _dio.get("/board/getCarrer");

  Future<Response> postImageUrl(String name) =>
      _dio.post("/resource/image", data: {"name": name});
}

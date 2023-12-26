import 'package:dio/dio.dart';

import 'http/dio_rest.dart';

class ApiProvider {
  ApiProvider._privateConstructor();

  static final ApiProvider _instance = ApiProvider._privateConstructor();

  factory ApiProvider() => _instance;

  static final Dio _dio = DioRest().to();

  Future<Response> getInfo() => _dio.get("/info");

  Future<Response> getWebHeaders() => _dio.get("/menu/webHeaders");

  Future<Response> getPortfolioInfo() => _dio.get("/board/portfolioInfo");

  Future<Response> getAboutMe() => _dio.get("/board/aboutMe");

  Future<Response> getCarrer() => _dio.get("/board/getCarrer");

  Future<Response> postImageUrl(String name, String extension) => _dio
      .post("/resource/image", data: {"name": name, "extension": extension});

  Future<Response> postImagesUrl(List<Map<String, String>> bearItem) => _dio
      .post("/resource/images", data: bearItem);

  Future<Response> postBoardByCl(String boardCl) =>
      _dio.post("/board/getBoard", data: {"boardCl": boardCl});

  Future<Response> postSendEmail(
          String name, String email, String subject, String message) =>
      _dio.post("/email/postSendEmail", data: {
        "name": name,
        "email": email,
        "subject": subject,
        "message": message
      });
}

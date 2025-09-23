import 'package:dio/dio.dart';

final class DioEnviroment {
  static const String _baseUrl = 'https://api.thedogapi.com/';
  static final String _apiKey =
      'live_T360G12hGTOxTj6pcZdl3JCS4qhKVZl8WKxm1Fdl1fTDCxWbnGX1jeEsuZZLdGHv';
  //TODO : Cambiar apiKey por una variable de entorno

  static Dio baseDioClient({String? url, String? key}) {
    final baseUrl = url ?? _baseUrl;
    final apiKey = key ?? _apiKey;

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-type': 'application/graphql',
          'Accept': 'application/json',
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';
import '../../model/character_model.dart';

class ApiService {
  ApiService([Dio? dio])
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://rickandmortyapi.com/api/',
                connectTimeout: const Duration(seconds: 12),
                receiveTimeout: const Duration(seconds: 12),
                responseType: ResponseType.json,
              ),
            );

  final Dio _dio;

  Future<CharacterModel> getCharacters({required int page}) async {
    final res = await _dio.get('character', queryParameters: {'page': page});
    if (res.statusCode == 200) {
      return CharacterModel.fromJson(res.data as Map<String, dynamic>);
    }
    throw Exception('Failed to load: ${res.statusCode}');
  }
}

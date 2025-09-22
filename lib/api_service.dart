import 'package:dio/dio.dart';
import 'character_model.dart';

class ApiService {

  Future<CharacterModel> getCharacters({int page = 1}) async {
    final dio = Dio();
    final response =
    await dio.get('https://rickandmortyapi.com/api/character/?page=$page');

    if (response.statusCode == 200) {
      return CharacterModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load items: ${response.statusCode}');
    }
  }
}
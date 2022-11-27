import 'package:dio/dio.dart';
import 'package:rickandmorty/src/constants.dart';
import 'package:rickandmorty/src/models/character.dart';

class CharacterService {
  static final Dio _dio = Dio();

  static Future<List<Character>> getAllCharacters() async {
    var apiUrl = '${Constants.baseURL}${Constants.characterEndpoint}';

    List<Map<String, dynamic>> allCharacters = [];

    var response = await _dio.get(apiUrl);

    if (response.statusCode == 200) {
      allCharacters.addAll(List<Map<String, dynamic>>.from(response.data["results"]));

      var listOfCharacters = List<Character>.from(allCharacters.map((x) => Character.fromJson(x)));

      return listOfCharacters;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

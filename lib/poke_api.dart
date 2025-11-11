// lib/poke_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApi {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<dynamic>> fetchPokemonList({int limit = 20, int offset = 0}) async {
    final response = await http.get(Uri.parse('$_baseUrl/pokemon?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }

  Future<Map<String, dynamic>> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
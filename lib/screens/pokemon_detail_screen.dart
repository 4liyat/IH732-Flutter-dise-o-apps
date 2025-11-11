// lib/screens/pokemon_detail_screen.dart
import 'package:flutter/material.dart';
import '../poke_api.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String pokemonUrl;

  const PokemonDetailScreen({super.key, required this.pokemonUrl});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late Future<Map<String, dynamic>> _pokemonDetails;

  @override
  void initState() {
    super.initState();
    _pokemonDetails = PokeApi().fetchPokemonDetails(widget.pokemonUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _pokemonDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Pokémon details found.'));
          } else {
            final pokemon = snapshot.data!;
            final String imageUrl = pokemon['sprites']['front_default'] ?? '';
            final List<dynamic> types = pokemon['types'];
            final List<dynamic> abilities = pokemon['abilities'];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pokemon['name'].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (imageUrl.isNotEmpty)
                    Image.network(
                      imageUrl,
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Types'),
                  Wrap(
                    spacing: 8.0,
                    children: types
                        .map((type) => Chip(label: Text(type['type']['name'])))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Abilities'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: abilities
                        .map((ability) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text('- ${ability['ability']['name']}'),
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

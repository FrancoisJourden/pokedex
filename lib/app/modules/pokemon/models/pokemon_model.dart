import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokemon/app/modules/pokemon/models/pokemon_ability_model.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_sprite_model.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_type_model.dart';

class Pokemon{
  Pokemon(this.id, this.name, this.abilities, this.sprite, this.types);

  int id;
  String name;
  List<PokemonAbility?> abilities;
  PokemonSprite sprite;
  List<PokemonType> types;

  static fromJson(Map<String, dynamic> json) async{
    var specie = (await http.get(Uri.parse(json['species']['url']))).body;
    int id = json['id'];

    // String name = (jsonDecode(specie)['names'] as List<dynamic>).firstWhere((element) => element['language']['name']=='fr')['name'];
    String name = json['name'];

    List<dynamic> abilitiesList = json['abilities'];
    List<PokemonAbility?> abilities = [];
    for (var element in abilitiesList) {
      // Map<String, dynamic> ab = jsonDecode(element);
      PokemonAbility ability = PokemonAbility(element['ability']['name'], element['ability']['url']);
      abilities.add(ability);
    }

    PokemonSprite sprite = PokemonSprite.fromJson(json['sprites']);

    List<dynamic> typesList = json['types'];
    List<PokemonType> types = [];
    for(var element in typesList){
      PokemonType type = PokemonType.fromJson(element);
      types.add(type);
    }
    
    return Pokemon(id, name, abilities, sprite, types);
  }


  static Future<Pokemon> fromUrl(String url) async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/bulbasaur');
    http.Response response = await http.get(url);
    return Pokemon.fromJson(jsonDecode(response.body));
  }
}
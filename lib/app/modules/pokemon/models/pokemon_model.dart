import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokemon/app/modules/pokemon/models/pokemon_ability_model.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_sprite_model.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_type_model.dart';

class Pokemon{
  Pokemon(this.id, this.name, this.description, this.abilities, this.sprite, this.types);

  int id;
  String name;
  String description;
  List<PokemonAbility?> abilities;
  PokemonSprite sprite;
  List<PokemonType> types;

  static fromJson(Map<String, dynamic> json) async{
    var specie = (await http.get(Uri.parse(json['species']['url']))).body;
    int id = json['id'];

    String name = json['name'];

    String description = (jsonDecode(specie)['flavor_text_entries'] as List<dynamic>).firstWhere((element) => element['language']['name']=='en')['flavor_text'].replaceAll('\n', ' ');

    List<dynamic> abilitiesList = json['abilities'];
    List<PokemonAbility?> abilities = [];
    for (var element in abilitiesList) {
      var url = Uri.parse(element['ability']['url']);
      http.Response response = await http.get(url);
      PokemonAbility ability = PokemonAbility.fromJson(jsonDecode(response.body));
      abilities.add(ability);
    }

    PokemonSprite sprite = PokemonSprite.fromJson(json['sprites']);

    List<dynamic> typesList = json['types'];
    List<PokemonType> types = [];
    for(var element in typesList){
      PokemonType type = PokemonType.fromJson(element);
      types.add(type);
    }
    
    return Pokemon(id, name, description, abilities, sprite, types);
  }


  static Future<Pokemon> fromUrl(String url) async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    return Pokemon.fromJson(jsonDecode(response.body));
  }
}
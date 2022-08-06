import 'dart:convert';

class PokemonAbility{
  PokemonAbility(this.name, this.url);

  String name;
  String url;

  factory PokemonAbility.fromJson(Map<String, dynamic> json){
    print(jsonEncode(json));
    String name = json['name'];
    String url = json['url'];

    return PokemonAbility(name, url);
  }
}
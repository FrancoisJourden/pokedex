import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonAbility{
  PokemonAbility(this.name, this.description);

  String name;
  String description;

  factory PokemonAbility.fromJson(Map<String, dynamic> json){
    String name = (json['names'] as List<dynamic>).firstWhere((element) => element['language']['name']=='en')['name'];
    String description = (json['flavor_text_entries'] as List<dynamic>).firstWhere((element) => element['language']['name']=='en')['flavor_text'].replaceAll('\n', ' ');

    return PokemonAbility(name, description);
  }

  static Future<PokemonAbility> fromUrl(String url) async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    return PokemonAbility.fromJson(jsonDecode(response.body));
  }
}
class PokemonType{
  String name;
  String url;

  PokemonType(this.name, this.url);

  factory PokemonType.fromJson(Map<String, dynamic> json){
    String name = json['type']['name'];
    String url = json['type']['url'];

    return PokemonType(name, url);
  }
}
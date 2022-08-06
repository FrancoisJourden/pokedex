class PokemonSprite{
  String backDefault;
  String? backFemale;
  String backShiny;
  String? backShinyFemale;
  String frontDefault;
  String? frontFemale;
  String frontShiny;
  String? frontShinyFemale;


  PokemonSprite(
      this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale);

  factory PokemonSprite.fromJson(Map<String, dynamic> json){
    String backDefault = json['back_default'];
    String? backFemale = json['back_female'];
    String backShiny = json['back_shiny'];
    String? backShinyFemale = json['back_shiny_female'];
    String frontDefault = json['front_default'];
    String? frontFemale = json['front_female'];
    String frontShiny = json['front_shiny'];
    String? frontShinyFemale = json['front_shiny_female'];

    return PokemonSprite(backDefault, backFemale, backShiny, backShinyFemale, frontDefault, frontFemale, frontShiny, frontShinyFemale);
  }
}
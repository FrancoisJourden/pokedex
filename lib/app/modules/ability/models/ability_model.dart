class Ability{
  Ability(this.name, this.id, this.effect, this.url, this.short_effect);

  final int? id;
  final String name;
  final String url;
  final String? effect;
  final String? short_effect;

  factory Ability.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    String name = json['name'];
    final String url = json['url'];
    String effect = json['effect'];
    final String short_effect = json['short_effect'];
    return Ability(name, id, effect, url, short_effect);
  }
}
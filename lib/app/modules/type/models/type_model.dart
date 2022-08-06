class Type{
  Type({required this.name, required this.url});
  final String name;
  final String url;

  factory Type.fromJson(Map<String, dynamic> json){
    String name = json['name'];
    String url = json['url]'];
    return Type(name: name, url: url);
  }
}
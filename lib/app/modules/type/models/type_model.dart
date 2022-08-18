class PType{
  PType({required this.name, required this.url});
  final String name;
  final String url;

  factory PType.fromJson(Map<String, dynamic> json){
    String name = json['name'];
    String url = json['url]'];
    return PType(name: name, url: url);
  }
}
  class Category{
  int id;
  String name;
  String decription;

  Category(
      {required this.id,
      required this.name,
      required this.decription});

  factory Category.fromJson(Map<dynamic, dynamic> json) {
    return Category(
        id: json["ID"],
        name: json["Name"],
        decription: json["Decription"],
        );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["ID"] = id;
    json["Name"] = name;
    json["Decription"] = decription;
    return json;
  }
}

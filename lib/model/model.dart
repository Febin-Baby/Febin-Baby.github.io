class DataModel {
  //Types of values coming the pages

  int? id;
  String? tittle;
  String? description;
  double? price;
  String? catogory;
  String? image;

  //Constructor

  DataModel({
    this.id,
    this.description,
    this.price,
    this.catogory,
    this.image,
    this.tittle,
  });

  //create fromjson

  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      description: json["description"],
      price: json['price'],
      catogory: json["category"],
      image: json["image"],
      tittle: json["title"],
    );
  }

  //create toJson
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      "description": description,
      'price': price,
      "category": catogory,
      "image": image,
      "title": tittle,
    };
  }
}

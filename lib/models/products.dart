class Products {
  final int id;
  final String name;
  final num price;
  final String color;
  final String desc;
  final String image;

  Products(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.desc,
      required this.image});

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}

class catalogModel {
  /* static final catModel = catalogModel._internal();

  catalogModel._internal();

  factory catalogModel() => catModel;*/

  static List<Products> products = [];

  // get Item by Id

  static Products getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  static Products getByPosition(int pos) => products[pos];
}

class Products {
  final int id;
  final String name;
  final num price;
  final String color;
  final String desc;
  final String imageUrl;

  Products(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.desc,
      required this.imageUrl});
}

class catalogModel {
  static final products = [
    Products(
        id: 001,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];
}

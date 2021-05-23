import 'package:flutter/material.dart';
import 'package:flutter_begins/models/products.dart';

class ProductWidget extends StatelessWidget {
  final Products products;

  const ProductWidget({Key? key, required this.products})
      : assert(products != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: () {
          print("${products.name} pressed");
        },
        leading: Image.network(products.image),
        title: Text(products.name),
        subtitle: Text(products.desc),
        trailing: Text(
          "\$${products.price}",
          textScaleFactor: 1.5,
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

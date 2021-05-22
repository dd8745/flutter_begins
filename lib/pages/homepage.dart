import 'package:flutter/material.dart';
import 'package:flutter_begins/models/products.dart';
import 'package:flutter_begins/widgets/ProductWidget.dart';
import 'package:flutter_begins/widgets/drawer.dart';

// Creating a stateless object. Name is HomePage
class HomePage extends StatelessWidget {
  final int days = 30;

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generating Dummy Data from the model
    final dummyList = List.generate(50, (index) => catalogModel.products[0]);
    return Scaffold(
        appBar: AppBar(title: Text("Catalogue App")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ProductWidget(products: dummyList[index]);
            },
          ),
        ),
        drawer: MyDrawer());
  }
}

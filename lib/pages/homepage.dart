import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_begins/models/products.dart';
import 'package:flutter_begins/utils/routes.dart';

import 'package:flutter_begins/widgets/ProductWidget.dart';
import 'package:flutter_begins/widgets/drawer.dart';
import 'package:flutter_begins/widgets/home_widgets/CatalogHeader.dart';
import 'package:flutter_begins/widgets/home_widgets/CatalogList.dart';
import 'package:flutter_begins/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

// Creating a stateless object. Name is HomePage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // Generating Dummy Data from the model
    // final dummyList = List.generate(50, (index) => catalogModel.products[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
      ).p32(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if (catalogModel.products.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
      /* appBar: AppBar(title: Text("Catalogue App")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (catalogModel.products != null &&
                  catalogModel.products.isNotEmpty)
              ? */ /*ListView.builder(
                  itemCount: catalogModel.products.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                        products: catalogModel.products[index]);
                  },
                )*/ /*
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final item = catalogModel.products[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: GridTile(
                          child: Image.network(item.image),
                          header: Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                          ),
                          footer: Text(item.price.toString()),
                        ));
                  },
                  itemCount: catalogModel.products.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer()*/
    );
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // dart:convert library used to encode and decode
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    catalogModel.products = List.from(productData)
        .map<Products>((products) => Products.fromMap(products))
        .toList();
    setState(() {});
  }
}

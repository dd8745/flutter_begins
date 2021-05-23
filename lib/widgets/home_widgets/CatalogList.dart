import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begins/models/CartModel.dart';
import 'package:flutter_begins/models/products.dart';
import 'package:flutter_begins/pages/HomeDetailsPage.dart';
import 'package:flutter_begins/widgets/AddToCart.dart';
import 'package:flutter_begins/widgets/home_widgets/ProductImage.dart';
import 'package:flutter_begins/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogModel.products.length,
        itemBuilder: (context, index) {
          //final catalog = catalogModel.products[index];
          final catalog = catalogModel.getByPosition(index);
          return InkWell(
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetails(products: catalog))),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Products catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: ProductImage(image: catalog.image)),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.lg.bold.color(context.accentColor).make(),
                    catalog.desc.text.make(),
                    10.heightBox,
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        "\$${catalog.price}".text.make(),
                        AddToCart(
                          catalog: catalog,
                        ),
                      ],
                    ).pOnly(right: 8.0)
                  ],
                ))
          ],
        ))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py16();
  }
}



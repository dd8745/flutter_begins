import 'package:flutter/material.dart';
import 'package:flutter_begins/models/products.dart';
import 'package:flutter_begins/widgets/AddToCart.dart';
import 'package:flutter_begins/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key, required this.products}) : super(key: key);
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.cardColor,
        title: Text(
          products.name,
          style: TextStyle(color: context.accentColor),
        ),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${products.price}".text.xl4.color(context.accentColor).make(),
            ElevatedButton(
                    onPressed: () {
                      AddToCart(
                        catalog: products,
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(products.id.toString()),
                    child: Image.network(products.image))
                .h32(context),
            Expanded(
                child: VxArc(
              child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      products.name.text.xl4.bold
                          .color(context.accentColor)
                          .make(),
                      products.desc.text.xl.make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor urna a ante dapibus ullamcorper. Fusce pellentesque vel est nec volutpat. Curabitur hendrerit velit vel semper pharetra. Nam turpis lacus, facilisis non tortor eget, semper rutrum odio. Sed nec tellus commodo, luctus neque vitae, feugiat urna. In nec dolor ut mauris condimentum ultricies non ut turpis. "
                          .text
                          .make()
                          .p16(),
                    ],
                  ).py32()),
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
            ))
          ],
        ),
      ),
    );
  }
}

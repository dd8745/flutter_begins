// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begins/models/CartModel.dart';
import 'package:flutter_begins/models/products.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_begins/core/store.dart';

class AddToCart extends StatelessWidget {
  final Products catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart!.items!.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        final product = catalogModel();
        if (_cart.items!.contains(catalog)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "This Item is already in the cart !!!!".text.make()));
        } else {
         AddMutation(catalog);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Item successfully added to cart.".text.make()));
        }
        // setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begins/core/store.dart';
import 'package:flutter_begins/models/CartModel.dart';
import 'package:flutter_begins/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            "\$${_cart!.totalPrice}"
                .text
                .xl5
                .color(context.theme.accentColor)
                .make(),
            30.widthBox,
            ElevatedButton(
                onPressed: () {
                  _cart.items!.isEmpty
                      ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "There are no Items in the cart to checkout"
                              .text
                              .make()))
                      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              "Buying is not supported yet !!!".text.make()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.buttonColor)),
                child: "Checkout".text.white.make())
          ],
        ));
  }
}

class CartList extends StatelessWidget {
  final CartModel? _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return _cart!.items!.isEmpty
        ? NoDataFound()
        : ListView.builder(
            itemCount: _cart!.items!.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(CupertinoIcons.check_mark),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  _cart!.removeItemFromCart(_cart!.items![index]);
                  // setState(() {});
                },
              ),
              title: _cart!.items![index].name.text.make(),
            ),
          );
  }
}

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          50.heightBox,
          Image.asset("assets/images/empty_cart.png", fit: BoxFit.cover),
          30.heightBox,
          "There is nothing so far here. Start Shopping.".text.xl3.make(),
        ],
      ),
    );
  }
}

import 'package:flutter_begins/models/CartModel.dart';
import 'package:flutter_begins/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  catalogModel? catalog;
  CartModel? cart;

  MyStore() {
    cart = CartModel();
    catalog = catalogModel();
    cart!.product = catalog!;
  }
}

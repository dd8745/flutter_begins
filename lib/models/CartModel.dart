import 'package:flutter_begins/core/store.dart';
import 'package:flutter_begins/models/products.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  /* static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;*/

  catalogModel? _products;

  // Collections of Ids = store ids of each item
  final List<int> _itemsIds = [];

  catalogModel? get products => _products;

  set product(catalogModel newCatalog) {
    _products = newCatalog;
  }

  //get Items in the Cart
  List<Products>? get items =>
      _itemsIds.map((id) => catalogModel.getById(id)).toList();

  //get Total price
  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);

/*// Add Items
  void addItem(Products item) {
    _itemsIds.add(item.id);
  }*/

// remove Items
  void removeItemFromCart(Products items) {
    _itemsIds.remove(items.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Products product;

  AddMutation(this.product);

  @override
  perform() {
    store!.cart!._itemsIds.add(product.id);
  }
}

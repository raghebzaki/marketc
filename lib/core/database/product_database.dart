import 'package:hive/hive.dart';

import '../shared/entities/product_entity.dart';

class ProductDataBase {
  // final String productListKey = "ProductListKey";
  // final String productBoxName = "ProductDataBase";
  final String cartBoxName = "CartDataBase";

  Future<Box<ProductEntity>> get cartBox async =>
      await Hive.openBox<ProductEntity>(cartBoxName);

  Future<void> addProduct(ProductEntity productEntity) async {
    var box = await cartBox;
    await box.add(productEntity);
  }

  Future<List<ProductEntity>> getAllProducts() async {
    var box = await cartBox;
    return box.values.toList();
  }

  Future<void> deleteProduct(num id) async {
    var box = await cartBox;
    final Map<dynamic, ProductEntity> productMap = box.toMap();
    dynamic desiredKey;
    productMap.forEach((key, value) {
      if (value.id == id) {
        desiredKey = key;
      }
    });

    box.delete(desiredKey);
  }

  Future<void> clearDataBase() async {
    var box = await cartBox;
    box.clear();
  }

// Future<void> deleteProduct(int index) async {
//   var box = await productBox;
//   box.deleteAt(index);
// }
//
// Future<void> getAt(int index) async {
//   var box = await productBox;
//   box.getAt(index);
// }
}

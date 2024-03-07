import 'package:hive/hive.dart';

import '../shared/entities/product_entity.dart';
import 'address_class.dart';

class HiveDatabase {
  final String boxName = "AddressDataBase";

  Future<Box<Address>> get addressBox async => await Hive.openBox<Address>(boxName);

  Future<void> addAddress(Address address) async {
    var box = await addressBox;
    await box.add(address);
  }

  Future<List<Address>> getAllAddresses() async {
    var box = await addressBox;
    return box.values.toList();
  }

  Future<void> deleteAddress(int index) async {
    var box = await addressBox;
    box.deleteAt(index);
  }

  Future<void> getAt(int index) async {
    var box = await addressBox;
    box.getAt(index);
  }

  ///***********************************///

  final String productListKey = "ProductListKey";
  final String productBoxName = "ProductDataBase";

  Future<Box<ProductEntity>> get productsBox async => await Hive.openBox<ProductEntity>(productBoxName);

  Future<void> addProduct(ProductEntity productEntity) async {
    var box = await productsBox;
    await box.add( productEntity);
  }

  Future<List<ProductEntity>?> getAllProducts() async {
    var box = await productsBox;
    return box.values.toList();
  }

  Future<void> deleteProduct(ProductEntity productEntity) async {
    var box = await productsBox;
    box.delete(productEntity);
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

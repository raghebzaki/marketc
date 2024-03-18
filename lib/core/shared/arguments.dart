import 'package:geocoding/geocoding.dart';
import 'package:marketc/core/database/address_class.dart';
import 'package:marketc/core/shared/entities/order_entity.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

class VerifyAccountArgs {
  final String email;

  VerifyAccountArgs({required this.email});
}

class ResetPassArgs {
  final String email;

  ResetPassArgs({required this.email});
}

class ChangePassArgs {
  final String email;

  ChangePassArgs({required this.email});
}

class CategoryDetailsArgs {
  final num id;
  final String name;

  CategoryDetailsArgs({required this.id, required this.name});
}

class NewAddressArgs {
  final Placemark address;

  NewAddressArgs({required this.address});
}

class AddressArgs {
  final Address address;
  final String? name;

  AddressArgs(this.name, {required this.address});
}

class ProductsEntityArgs {
  final ProductEntity productEntity;

  ProductsEntityArgs({required this.productEntity});
}

class EditProductArgs {
  final ProductEntity productDetails;

  EditProductArgs({required this.productDetails});
}

class PaymentSharedPrice {
  final num sharedPrice;
  final Address address;
  final String name;
  final num? gift;
  final num? askAboutAddress;

  PaymentSharedPrice({
    required this.address,
    required this.sharedPrice,
    required this.name,
    required this.gift,
    required this.askAboutAddress,
  });
}

class OrderDetailsArgs {
  final OrderEntity orderDetails;

  OrderDetailsArgs({required this.orderDetails});
}

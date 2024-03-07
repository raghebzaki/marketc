import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database/database_hive.dart';
import '../../entities/product_entity.dart';

part 'cart_cubit.freezed.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.hiveDatabase) : super(const CartStates.initial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProductEntity> cartProducts = [];

  final HiveDatabase hiveDatabase;

  addToCart(ProductEntity productEntity) async {
    if (cartProducts.any((item) => item.id == productEntity.id)) {
      cartProducts;
      await hiveDatabase.addProduct(cartProducts);
      emit(CartStates.alreadyAdded(cartProducts));
    } else {
      // cartProducts = List<ProductEntity>.from().add(productEntity);
      cartProducts.add(productEntity);
      await hiveDatabase.addProduct(cartProducts);
      emit(CartStates.addedToCart(cartProducts));
    }
  }

  removeFromCart(ProductEntity productEntity) {
    cartProducts.remove(productEntity);
    hiveDatabase.addProduct(cartProducts);
    emit(
      CartStates.removedFromCart(cartProducts),
    );
  }


  List<ProductEntity>? products = [];

  getCartItems() async {
    products = await hiveDatabase.getAllProducts();
    emit(
      CartStates.cartItems(products!),
    );
  }

  // getAddresses() async {
  //   emit(
  //     const SavedAddressesStates.loading(),
  //   );
  //
  //   try {
  //     var addresses = await hiveDatabase.getAllAddresses();
  //     emit(SavedAddressesStates.success(addresses));
  //   } catch (err) {
  //     emit(
  //       SavedAddressesStates.error(
  //         err.toString(),
  //       ),
  //     );
  //   }
  // }


}

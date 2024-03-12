import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/core/database/product_database.dart';

import '../../../database/database_hive.dart';
import '../../entities/product_entity.dart';

part 'cart_cubit.freezed.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.productDataBase) : super(const CartStates.initial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProductEntity> cartProducts = [];

  // final HiveDatabase hiveDatabase;
  final ProductDataBase productDataBase;

  addToCart(ProductEntity productEntity) async {
    if (products!.any((item) => item.id == productEntity.id)) {
      emit(CartStates.alreadyAdded(products!));
    } else {
      // cartProducts = List<ProductEntity>.from().add(productEntity);
      products!.add(productEntity);
      await productDataBase.addProduct(productEntity);
      emit(CartStates.addedToCart(products!));
    }
  }

  removeFromCart(ProductEntity productEntity) {
    products!.remove(productEntity);
    productDataBase.deleteProduct(productEntity.id!);
    emit(
      CartStates.removedFromCart(products!),
    );
  }


  List<ProductEntity>? products = [];

  getCartItems() async {
    products = await productDataBase.getAllProducts();
    emit(
      CartStates.cartItems(products!),
    );
  }

  clearDatabase() async {
    await productDataBase.clearDataBase();
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

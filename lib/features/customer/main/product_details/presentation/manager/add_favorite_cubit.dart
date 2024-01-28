import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/product_details/domain/entities/add_favorite_entity.dart';
import 'package:marketc/features/customer/main/product_details/domain/use_cases/add_favorite_use_case.dart';

part 'add_favorite_state.dart';

part 'add_favorite_cubit.freezed.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteStates> {
  AddFavoriteCubit({required this.favoriteUseCase})
      : super(const AddFavoriteStates.initial());

  static AddFavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  final AddFavoriteUseCase favoriteUseCase;

  addFavorite(num? userId, num? productId) async {
    emit(const AddFavoriteStates.loading());

    final addProduct = await favoriteUseCase(userId, productId);

    addProduct.fold(
      (l) => {
        emit(
          AddFavoriteStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          AddFavoriteStates.success(r),
        ),
      },
    );
  }
}

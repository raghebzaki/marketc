import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/product_details/domain/use_cases/check_if_favorite_use_case.dart';

import '../../domain/entities/add_favorite_entity.dart';

part 'check_if_favorite_state.dart';
part 'check_if_favorite_cubit.freezed.dart';

class CheckIfFavoriteCubit extends Cubit<CheckIfFavoriteState> {
  CheckIfFavoriteCubit({required this.checkUseCase}) : super(const CheckIfFavoriteState.initial());

  static CheckIfFavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  final CheckIfFavoriteUseCase checkUseCase;

  checkFavorite(num? userId, num? productId) async {
    emit(const CheckIfFavoriteState.loading());

    final check = await checkUseCase(userId, productId);

    check.fold(
          (l) => {
        emit(
          CheckIfFavoriteState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          CheckIfFavoriteState.success(r),
        ),
      },
    );
  }
}

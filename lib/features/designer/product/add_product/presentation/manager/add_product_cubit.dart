import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/product/add_product/domain/entities/add_product_entity.dart';

import '../../domain/use_cases/add_product_usecase.dart';

part 'add_product_state.dart';

part 'add_product_cubit.freezed.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit({required this.addProductUseCase})
      : super(const AddProductStates.initial());

  static AddProductCubit get(BuildContext context) => BlocProvider.of(context);

  final AddProductUseCase addProductUseCase;

  userLogin(AddProductEntity addProductEntity) async {
    emit(const AddProductStates.loading());
    final login = await addProductUseCase(addProductEntity);

    login.fold(
      (l) {
        emit(
          AddProductStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          AddProductStates.success(r),
        );
      },
    );
  }
}

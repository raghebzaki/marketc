import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/main/categories/domain/entities/delete_product_entity.dart';
import 'package:marketc/features/designer/main/categories/domain/use_cases/delete_products_usecase.dart';

part 'delete_product_state.dart';
part 'delete_product_cubit.freezed.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit({required this.deleteProductUseCase}) : super(const DeleteProductState.initial());

  static DeleteProductCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final DeleteProductUseCase deleteProductUseCase;

  deleteProduct(DeleteProductEntity deleteProductEntity) async {
    emit(const DeleteProductState.loading());
    final login = await deleteProductUseCase(deleteProductEntity);

    login.fold(
          (l) {

          emit(
            DeleteProductState.error(
              l.code.toString(),
              l.message,
            ),
          );

      },
          (r) async {
        emit(
          DeleteProductState.success(r),
        );
      },
    );
  }
}

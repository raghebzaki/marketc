import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/edit_product_entity.dart';
import '../../domain/use_cases/edit_product_usecase.dart';

part 'edit_product_state.dart';
part 'edit_product_cubit.freezed.dart';

class EditProductCubit extends Cubit<EditProductStates> {
  EditProductCubit({required this.editProductUseCase}) : super(const EditProductStates.initial());

  static EditProductCubit get(BuildContext context) => BlocProvider.of(context);

  final EditProductUseCase editProductUseCase;

  userLogin(EditProductEntity editProductEntity) async {
    emit(const EditProductStates.loading());
    final login = await editProductUseCase(editProductEntity);

    login.fold(
          (l) {
        emit(
          EditProductStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
          (r) async {
        emit(
          EditProductStates.success(r),
        );
      },
    );
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/my_designer_products_entity.dart';
import '../../domain/use_cases/my_designer_products_usecase.dart';

part 'my_designer_products_state.dart';

part 'my_designer_products_cubit.freezed.dart';

class MyDesignerProductsCubit extends Cubit<MyDesignerProductsStates> {
  MyDesignerProductsCubit({required this.myDesignerProductsUseCase})
      : super(const MyDesignerProductsStates.initial());

  static MyDesignerProductsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final MyDesignerProductsUseCase myDesignerProductsUseCase;

  userLogin(MyDesignerProductsEntity myDesignerProductsEntity) async {
    emit(const MyDesignerProductsStates.loading());
    final login = await myDesignerProductsUseCase(myDesignerProductsEntity);

    login.fold(
      (l) {
        emit(
          MyDesignerProductsStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          MyDesignerProductsStates.success(r),
        );
      },
    );
  }
}

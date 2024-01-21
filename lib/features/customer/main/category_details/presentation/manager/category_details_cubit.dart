import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_details_entity.dart';
import '../../domain/use_cases/get_category_products_usecase.dart';

part 'category_details_states.dart';

part 'category_details_cubit.freezed.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsStates> {
  CategoryDetailsCubit({required this.getCategoryProductsUseCase})
      : super(const CategoryDetailsStates.initial());

  static CategoryDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final GetCategoryProductsUseCase getCategoryProductsUseCase;

  getProducts(CategoryDetailsEntity categoryDetailsEntity) async {
    emit(const CategoryDetailsStates.loading());

    final products = await getCategoryProductsUseCase(categoryDetailsEntity);

    products.fold(
      (l) => {
        emit(
          CategoryDetailsStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          CategoryDetailsStates.success(r),
        ),
      },
    );
  }
}

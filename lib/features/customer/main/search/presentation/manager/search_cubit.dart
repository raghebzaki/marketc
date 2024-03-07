import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/search/domain/usecases/search_use_case.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../domain/entities/search_entity.dart';

part 'search_state.dart';

part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.searchUseCase})
      : super(const SearchStates.initial());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  final SearchUseCase searchUseCase;

  searchProducts(SearchEntity searchEntity) async {
    if (searchEntity.nextPage == 1) {
      emit(const SearchStates.loading());
    } else {
      emit(const SearchStates.paginationLoading());
    }

    final products = await searchUseCase(searchEntity);

    products.fold(
      (l) => {
        if (searchEntity.nextPage == 1)
          {
            emit(
              SearchStates.error(l.code.toString(), l.message),
            ),
          }
        else
          {
            emit(
              SearchStates.paginationError(l.code.toString(), l.message),
            ),
          }
      },
      (r) => {
        emit(
          SearchStates.success(r),
        ),
      },
    );
  }
}

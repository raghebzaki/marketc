import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/home/domain/use_cases/new_products_use_case.dart';

import '../../../../../../core/shared/entities/product_entity.dart';

part 'new_products_state.dart';
part 'new_products_cubit.freezed.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit({required this.newProductsUseCase}) : super(const NewProductsState.initial());
  static NewProductsCubit get(context) => BlocProvider.of(context);

  final NewProductsUseCase newProductsUseCase;

  getAllProducts(int? nextPage) async {
    if (nextPage == 1) {
      emit(const NewProductsState.loading());
    } else {
      emit(const NewProductsState.paginationLoading());
    }

    final getAllProduct = await getAllProducts( nextPage);

    getAllProduct.fold(
          (l) => {
        if (nextPage == 1)
          {
            emit(
              NewProductsState.error(
                l.code.toString(),
                l.message,
              ),
            ),
          }
        else
          {
            emit(
              NewProductsState.paginationError(
                l.code.toString(),
                l.message,
              ),
            ),
          }
      },
          (r) => {
        emit(
          NewProductsState.success(r),
        ),
      },
    );
  }
}

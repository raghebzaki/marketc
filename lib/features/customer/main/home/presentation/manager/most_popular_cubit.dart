import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';
import 'package:marketc/features/customer/main/home/domain/use_cases/most_popular_use_case.dart';

part 'most_popular_state.dart';
part 'most_popular_cubit.freezed.dart';

class MostPopularCubit extends Cubit<MostPopularState> {
  MostPopularCubit({required this.mostPopularUseCase}) : super(const MostPopularState.initial());

  static MostPopularCubit get(context) => BlocProvider.of(context);

  final MostPopularUseCase mostPopularUseCase;

  getAllProducts(int? nextPage) async {
    if (nextPage == 1) {
      emit(const MostPopularState.loading());
    } else {
      emit(const MostPopularState.paginationLoading());
    }

    final getAllProduct = await getAllProducts( nextPage);

    getAllProduct.fold(
          (l) => {
        if (nextPage == 1)
          {
            emit(
              MostPopularState.error(
                l.code.toString(),
                l.message,
              ),
            ),
          }
        else
          {
            emit(
              MostPopularState.paginationError(
                l.code.toString(),
                l.message,
              ),
            ),
          }
      },
          (r) => {
        emit(
          MostPopularState.success(r),
        ),
      },
    );
  }
}

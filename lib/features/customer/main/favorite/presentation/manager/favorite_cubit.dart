import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/favorite/domain/entities/favorite_entity.dart';
import 'package:marketc/features/customer/main/favorite/domain/use_cases/favorite_use_case.dart';

part 'favorite_state.dart';

part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.favoriteUseCase})
      : super(const FavoriteState.initial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  final FavoriteUseCase favoriteUseCase;

  getAllProducts(FavoriteEntity favoriteEntity) async {
    // if (nextPage == 1) {
    //   emit(const FavoriteState.loading());
    // } else {
    //   emit(const FavoriteState.paginationLoading());
    // }
    emit(const FavoriteState.loading());

    final getAllProduct = await favoriteUseCase(favoriteEntity);

    getAllProduct.fold(
      (l) => {
        // if (nextPage == 1)
        //   {
        //     emit(
        //       FavoriteState.error(
        //         l.code.toString(),
        //         l.message,
        //       ),
        //     ),
        //   }
        // else
        //   {
        //     emit(
        //       FavoriteState.paginationError(
        //         l.code.toString(),
        //         l.message,
        //       ),
        //     ),
        //   }
        emit(
          FavoriteState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          FavoriteState.success(r),
        ),
      },
    );
  }
}

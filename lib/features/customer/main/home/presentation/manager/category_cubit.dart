import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/home/domain/entities/category_entity.dart';

import '../../domain/use_cases/category_use_case.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.carouselUseCase}) : super(const CategoryState.initial());
  static CategoryCubit get(context) => BlocProvider.of(context);

  final CategoryUseCase carouselUseCase;

  getAllCategory() async {

    emit(const CategoryState.loading());

    final getAllCarousel = await carouselUseCase();

    getAllCarousel.fold(
          (l) => {
        emit(
          CategoryState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          CategoryState.success(r),
        ),
      },
    );
  }
}

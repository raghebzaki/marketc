import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/category_details/domain/entities/sub_category_entity.dart';
import 'package:marketc/features/customer/main/category_details/domain/use_cases/sub_category_use_case.dart';

part 'sub_category_state.dart';
part 'sub_category_cubit.freezed.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit({required this.subCategoryUseCase}) : super(const SubCategoryState.initial());
  static SubCategoryCubit get(context) => BlocProvider.of(context);

  final SubCategoryUseCase subCategoryUseCase;

  getAllSubCategory() async {

    emit(const SubCategoryState.loading());

    final getAllCarousel = await subCategoryUseCase();

    getAllCarousel.fold(
          (l) => {
        emit(
          SubCategoryState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          SubCategoryState.success(r),
        ),
      },
    );
  }
}

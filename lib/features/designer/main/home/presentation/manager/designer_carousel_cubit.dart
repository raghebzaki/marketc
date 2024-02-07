import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/designer_carousel_entity.dart';
import '../../domain/use_cases/designer_carousel_use_case.dart';

part 'designer_carousel_state.dart';

part 'designer_carousel_cubit.freezed.dart';

class DesignerCarouselCubit extends Cubit<DesignerCarouselState> {
  DesignerCarouselCubit({required this.carouselUseCase})
      : super(const DesignerCarouselState.initial());

  static DesignerCarouselCubit get(context) => BlocProvider.of(context);

  final DesignerCarouselUseCase carouselUseCase;

  getAds(int nextPage) async {
    nextPage == 1
        ? emit(const DesignerCarouselState.loading())
        : emit(const DesignerCarouselState.paginationLoading());

    final getAllCarousel = await carouselUseCase(nextPage);

    getAllCarousel.fold(
      (l) => {
        nextPage == 1
            ? emit(
                DesignerCarouselState.error(
                  l.code.toString(),
                  l.message,
                ),
              )
            : emit(
                DesignerCarouselState.paginationError(
                  l.code.toString(),
                  l.message,
                ),
              ),
      },
      (r) => {
        emit(
          DesignerCarouselState.success(r),
        ),
      },
    );
  }
}

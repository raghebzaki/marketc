import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/main/home/domain/entities/carousel_entity.dart';
import 'package:marketc/features/customer/main/home/domain/use_cases/carousel_use_case.dart';

part 'carousel_state.dart';
part 'carousel_cubit.freezed.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit({required this.carouselUseCase}) : super(const CarouselState.initial());
  static CarouselCubit get(context) => BlocProvider.of(context);

  final CarouselUseCase carouselUseCase;

  getAllProducts() async {

    emit(const CarouselState.loading());

    final getAllCarousel = await carouselUseCase();

    getAllCarousel.fold(
          (l) => {
            emit(
              CarouselState.error(
                l.code.toString(),
                l.message,
              ),
            ),
      },
          (r) => {
        emit(
          CarouselState.success(r),
        ),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/color_entity.dart';
import '../../../domain/use_cases/color_use_case.dart';

part 'colors_state.dart';

part 'colors_cubit.freezed.dart';

class ColorsCubit extends Cubit<ColorsStates> {
  ColorsCubit({required this.colorsUseCase})
      : super(const ColorsStates.initial());

  static ColorsCubit get(BuildContext context) => BlocProvider.of(context);

  final ColorsUseCase colorsUseCase;

  getColors() async {
    emit(const ColorsStates.loading());
    final colors = await colorsUseCase();

    colors.fold(
      (l) => {
        emit(
          ColorsStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          ColorsStates.success(r),
        ),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/size_entity.dart';
import '../../../domain/use_cases/size_use_case.dart';

part 'sizes_state.dart';

part 'sizes_cubit.freezed.dart';

class SizesCubit extends Cubit<SizesStates> {
  SizesCubit({required this.sizesUseCase}) : super(const SizesStates.initial());

  static SizesCubit get(BuildContext context) => BlocProvider.of(context);

  final SizesUseCase sizesUseCase;

  getSizes() async {
    emit(const SizesStates.loading());
    final sizes = await sizesUseCase();

    sizes.fold(
      (l) => {
        emit(
          SizesStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          SizesStates.success(r),
        ),
      },
    );
  }
}

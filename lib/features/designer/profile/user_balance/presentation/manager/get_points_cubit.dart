import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/get_points_entity.dart';
import '../../domain/use_cases/get_points_use_case.dart';

part 'get_points_state.dart';
part 'get_points_cubit.freezed.dart';

class GetPointsCubit extends Cubit<GetPointsState> {
  GetPointsCubit({required this.getPointsUseCase}) : super(const GetPointsState.initial());

  final GetPointsUseCase getPointsUseCase;
  static GetPointsCubit get(context) => BlocProvider.of(context);

  getGetPoints(num? userId) async {

    emit(const GetPointsState.loading());

    final send = await getPointsUseCase(userId);

    send.fold(
          (l) => {
        emit(
          GetPointsState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          GetPointsState.success(r),
        ),
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/main/home/domain/entities/designer_stats_entity.dart';
import 'package:marketc/features/designer/main/home/domain/use_cases/designer_stats_use_case.dart';

part 'stats_state.dart';

part 'stats_cubit.freezed.dart';

class StatsCubit extends Cubit<StatsStates> {
  StatsCubit({required this.statsUseCase}) : super(const StatsStates.initial());

  static StatsCubit get(context) => BlocProvider.of(context);

  final DesignerStatsUseCase statsUseCase;

  getStats(DesignerStatsEntity designerStatsEntity) async {
    emit(const StatsStates.loading());

    final getAllStats = await statsUseCase(designerStatsEntity);

    getAllStats.fold(
      (l) => {
        emit(
          StatsStates.error(
            l.code.toString(),
            l.message,
          ),
        )
      },
      (r) => {
        emit(
          StatsStates.success(r),
        ),
      },
    );
  }
}

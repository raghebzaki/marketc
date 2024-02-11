part of 'stats_cubit.dart';

@freezed
class StatsStates with _$StatsStates {
  const factory StatsStates.initial() = _Initial;
  const factory StatsStates.loading() = Loading;
  const factory StatsStates.success(final DesignerStatsEntity stats) = Success;
  const factory StatsStates.error(final String errCode, final String err) = Error;
}

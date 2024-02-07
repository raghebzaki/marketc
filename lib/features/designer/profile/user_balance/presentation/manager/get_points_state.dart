part of 'get_points_cubit.dart';

@freezed
class GetPointsState with _$GetPointsState {
  const factory GetPointsState.initial() = _Initial;
  const factory GetPointsState.loading() = Loading;
  const factory GetPointsState.success(final List<GetPointsEntity>? getPoints) = Success;
  const factory GetPointsState.error(final String? errCode, final String? err) = Error;
}

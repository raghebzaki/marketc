part of 'designs_cubit.dart';

@freezed
class DesignsState with _$DesignsState {
  const factory DesignsState.initial() = _Initial;
  const factory DesignsState.loading() = Loading;
  const factory DesignsState.success(final List<DesignsEntity>? designsEntity) = Success;
  const factory DesignsState.error(final String? errCode, final String? err) = Error;
  const factory DesignsState.paginationLoading() = PaginationLoading;
  const factory DesignsState.paginationError(final String? errCode, final String? err) = PaginationSuccess;
}

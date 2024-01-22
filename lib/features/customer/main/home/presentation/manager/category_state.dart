part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.success(final List<CategoryEntity>? categoryEntity) = Success;
  const factory CategoryState.error(final String? errCode, final String? err) = Error;
}

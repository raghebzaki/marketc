part of 'sub_category_cubit.dart';

@freezed
class SubCategoryState with _$SubCategoryState {
  const factory SubCategoryState.initial() = _Initial;
  const factory SubCategoryState.loading() = Loading;
  const factory SubCategoryState.success(final List<SubCategoryEntity>? subCategoryEntity) = Success;
  const factory SubCategoryState.error(final String? errCode, final String? err) = Error;
}

part of 'sizes_cubit.dart';

@freezed
class SizesStates with _$SizesStates {
  const factory SizesStates.initial() = _Initial;
  const factory SizesStates.loading() = Loading;
  const factory SizesStates.success(final List<ProductSizesEntity> sizes) = Success;
  const factory SizesStates.error(final String errCode, final String err) = Error;
}

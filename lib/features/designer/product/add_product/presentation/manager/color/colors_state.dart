part of 'colors_cubit.dart';

@freezed
class ColorsStates with _$ColorsStates {
  const factory ColorsStates.initial() = _Initial;
  const factory ColorsStates.loading() = Loading;
  const factory ColorsStates.success(final List<ProductColorsEntity> colors) = Success;
  const factory ColorsStates.error(final String errCode, final String err) = Error;
}

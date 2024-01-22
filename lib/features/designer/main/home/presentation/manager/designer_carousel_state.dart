part of 'designer_carousel_cubit.dart';

@freezed
class DesignerCarouselState with _$DesignerCarouselState {
  const factory DesignerCarouselState.initial() = _Initial;
  const factory DesignerCarouselState.loading() = Loading;
  const factory DesignerCarouselState.success(final List<DesignerCarouselEntity>? designerCarouselEntity) = Success;
  const factory DesignerCarouselState.error(final String? errCode, final String? err) = Error;
}

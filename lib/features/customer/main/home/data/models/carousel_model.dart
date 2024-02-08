import 'package:marketc/features/customer/main/home/domain/entities/carousel_entity.dart';

import '../../../../../../core/utils/app_constants.dart';

class CarouselModel extends CarouselEntity {
  const CarouselModel({
    super.id,
    super.title,
    super.description,
    super.image,
  });

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      id: json["id"] as num? ?? AppConstants.unknownNumValue,
      title: json["title"] as String? ?? AppConstants.unknownStringValue,
      description:
          json["description"] as String? ?? AppConstants.unknownStringValue,
      image: json["image"] as String?,
    );
  }
}

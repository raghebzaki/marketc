import 'package:marketc/features/customer/main/home/domain/entities/carousel_entity.dart';

class CarouselModel extends CarouselEntity{
  const CarouselModel({
    super.id,
    super.title,
    super.description,
    super.image,

  });


  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      id: json["id"] ,
      title: json["title"],
      description: json["description"] ,
      image: json["image"] ,
    );
  }
}
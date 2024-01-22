
import '../../domain/entities/designer_carousel_entity.dart';

class DesignerCarouselModel extends DesignerCarouselEntity{
  const DesignerCarouselModel({
    super.id,
    super.title,
    super.description,
    super.image,

  });


  factory DesignerCarouselModel.fromJson(Map<String, dynamic> json) {
    return DesignerCarouselModel(
      id: json["id"] ,
      title: json["title"],
      description: json["description"] ,
      image: json["image"] ,
    );
  }
}
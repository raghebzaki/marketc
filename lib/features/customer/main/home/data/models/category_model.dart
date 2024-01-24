
import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  const CategoryModel({
    super.id,
    super.nameEn,
    super.nameAr,
    super.descriptionEn,
    super.descriptionAr,
    super.image,

  });


  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] ,
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      descriptionEn: json["description_en"],
      descriptionAr: json["description_ar"],
      image: json["image"] ,
    );
  }
}
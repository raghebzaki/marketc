
import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  const CategoryModel({
    super.id,
    super.name,
    super.image,

  });


  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] ,
      name: json["name"],
      image: json["image"] ,
    );
  }
}
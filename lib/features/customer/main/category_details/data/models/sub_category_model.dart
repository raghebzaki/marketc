

import '../../domain/entities/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity{
  const SubCategoryModel({
    super.id,
    super.nameEn,
    super.nameAr,

  });


  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json["id"] ,
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
    );
  }
}
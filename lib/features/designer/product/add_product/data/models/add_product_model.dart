
import '../../domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {

  AddProductModel({
    super.status,
    super.msg,
    super.product,
  });
  factory AddProductModel.fromJson(Map<String, dynamic> map) {
    return AddProductModel(
      status: map['status'] as num,
      msg: map['message'] as String,
    );
  }

  static Map<String, dynamic> toJson(AddProductEntity addProductEntity) {
    return {
      "designer_id": addProductEntity.designerId,
      "category_id": addProductEntity.product!.categoryId,
      "sub_category_id": addProductEntity.product!.subCategoryId,
      "name_ar": addProductEntity.product!.nameAr,
      "name_en": addProductEntity.product!.nameEn,
      "price": addProductEntity.product!.price,
      "quantity": addProductEntity.product!.quantity,
      "discount_percentage": addProductEntity.product!.discountPercent,
      "color_id": addProductEntity.product!.color,
      "size_id": addProductEntity.product!.size,
      "description_ar": addProductEntity.product!.descriptionAr,
      "description_en": addProductEntity.product!.descriptionEn,
      "image": addProductEntity.product!.image,
    };
  }


}
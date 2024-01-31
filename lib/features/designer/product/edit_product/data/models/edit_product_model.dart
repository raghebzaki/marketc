import 'dart:convert';

import '../../domain/entities/edit_product_entity.dart';

class EditProductModel extends EditProductEntity {
  const EditProductModel({
    super.status,
    super.msg,
    super.product,
  });

  factory EditProductModel.fromJson(Map<String, dynamic> map) {
    return EditProductModel(
      status: map['status'] as num,
      msg: map['message'] as String,
    );
  }

  static Map<String, dynamic> toJson(EditProductEntity editProductEntity) {
    return {
      "category_id": editProductEntity.product!.categoryId,
      "sub_category_id": editProductEntity.product!.subCategoryId,
      "name_ar": editProductEntity.product!.nameAr,
      "name_en": editProductEntity.product!.nameEn,
      "price": editProductEntity.product!.price,
      "quantity": editProductEntity.product!.quantity,
      "discount_percentage": editProductEntity.product!.discountPercent,
      "color_id": jsonEncode(editProductEntity.product!.sendColor),
      "size_id": jsonEncode(editProductEntity.product!.sendSize),
      "description_ar": editProductEntity.product!.descriptionAr,
      "description_en": editProductEntity.product!.descriptionEn,
      "multiple_images": jsonEncode(editProductEntity.product!.imagesBase64),
      "image": editProductEntity.product!.image,
      "product_id": editProductEntity.product!.id,
    };
  }
}


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
      'id': editProductEntity.product!.id,
      'name': editProductEntity.product!.nameAr,
      'category_id': editProductEntity.product!.categoryId,
      'description': editProductEntity.product!.descriptionAr,
      'price': editProductEntity.product!.price,
      'discount_percent': editProductEntity.product!.discountPercent,
      'size': editProductEntity.product!.size,
      'color': editProductEntity.product!.color,
      'images': editProductEntity.product!.images,
    };
  }


}
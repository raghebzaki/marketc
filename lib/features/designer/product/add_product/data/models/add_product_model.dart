
import '../../domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {

  const AddProductModel({
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
      'id': addProductEntity.product!.id,
      'name': addProductEntity.product!.nameAr,
      'category_id': addProductEntity.product!.categoryId,
      'description': addProductEntity.product!.descriptionAr,
      'price': addProductEntity.product!.price,
      'discount_percent': addProductEntity.product!.discountPercent,
      'size': addProductEntity.product!.size,
      'color': addProductEntity.product!.color,
      'images': addProductEntity.product!.images,
    };
  }


}
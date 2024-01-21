import 'package:marketc/core/shared/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
      super.id,
      super.name,
      super.categoryId,
      super.description,
      super.price,
      super.discountPercent,
      super.size,
      super.color,
      super.images,
      super.status,
      super.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ,
      name: json["name"],
      categoryId: json["category_id"] ,
      description: json["description"],
      price: json["price"] ,
      discountPercent: json["discount_percent"],
      size: json["size"],
      color: json["color"] ,
      images: json["images"],
    );
  }
 factory ProductModel.addProductFromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json["status"] ,
      message: json["message"],
    );
  }

  static Map<String, dynamic> addProductToJson(ProductEntity productEntity) {
    return {
      'id': productEntity.id,
      'name': productEntity.name,
      'category_id': productEntity.categoryId,
      'description': productEntity.description,
      'price': productEntity.price,
      'discount_percent': productEntity.discountPercent,
      'size': productEntity.size,
      'color': productEntity.color,
      'images': productEntity.images,
    };
  }
}


import '../entities/product_entity.dart';

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
      id: json["id"],
      name: json["name"],
      categoryId: json["category_id"],
      description: json["description"],
      price: json["price"],
      discountPercent: json["discount_percent"],
      size: (json["size"])
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: (json["color"])
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json["images"])
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ProductModel.addProductFromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json["status"],
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

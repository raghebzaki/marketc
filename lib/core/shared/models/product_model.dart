
import 'package:marketc/core/shared/models/products_images_model.dart';
import 'package:marketc/features/designer/product/add_product/data/models/color_model.dart';
import 'package:marketc/features/designer/product/add_product/data/models/size_model.dart';

import '../entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.nameAr,
    super.nameEn,
    super.categoryId,
    super.subCategoryId,
    super.descriptionEn,
    super.descriptionAr,
    super.price,
    super.discountPercent,
    super.code,
    super.image,
    super.priceAfterDiscount,
    super.quantity,
    super.size,
    super.color,
    super.images,
    super.status,
    super.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      nameAr: json["name_ar"],
      nameEn: json["name_en"],
      categoryId: json["category_id"],
      descriptionAr: json["description_ar"],
      descriptionEn: json["description_en"],
      code: json["code"],
      price: json["price"],
      discountPercent: json["discount_percentage"],
      priceAfterDiscount: json["price_after_discount"],
      image: json["image"],
      size: json["sizes"] == null
          ? []
          : List<ProductSizesModel>.from(
          json["sizes"]!.map((x) => ProductSizesModel.fromJson(x))),
      color: json["colors"] == null
          ? []
          : List<ProductColorsModel>.from(
          json["colors"]!.map((x) => ProductColorsModel.fromJson(x))),
      images: json["product_images"] == null
          ? []
          : List<ProductsImagesModel>.from(
          json["product_images"]!.map((x) => ProductsImagesModel.fromJson(x))),
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
      'name': productEntity.nameAr,
      'category_id': productEntity.categoryId,
      'description': productEntity.descriptionAr,
      'price': productEntity.price,
      'discount_percent': productEntity.discountPercent,
      'size': productEntity.size,
      'color': productEntity.color,
      'images': productEntity.images,
    };
  }
}

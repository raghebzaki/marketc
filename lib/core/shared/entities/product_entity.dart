import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/products_images_entity.dart';

import '../../../features/designer/product/add_product/domain/entities/color_entity.dart';
import '../../../features/designer/product/add_product/domain/entities/size_entity.dart';

class ProductEntity extends Equatable {
  final num? id;
  final String? nameEn;
  final String? nameAr;
  final num? categoryId;
  final num? subCategoryId;
  final String? descriptionEn;
  final String? descriptionAr;
  final String? code;
  final String? price;
  final int? discountPercent;
  final String? priceAfterDiscount;
  final String? image;
  final num? quantity;
  final List<ProductSizesEntity>? size;
  final List<ProductColorsEntity>? color;
  final List<ProductsImagesEntity>? images;
  final String? status;
  final String? message;

  const ProductEntity({
    this.nameEn, this.nameAr, this.subCategoryId, this.descriptionEn, this.descriptionAr,
    this.code, this.priceAfterDiscount, this.image, this.quantity,
    this.id,
    this.categoryId,
    this.price,
    this.discountPercent,
    this.size,
    this.color,
    this.images,
    this.status,
    this.message,
  });

  @override
  List<Object?> get props =>
      [
        id,
        nameEn,
        nameAr,
        categoryId,
        subCategoryId,
        descriptionEn,
        descriptionAr,
        code,
        price,
        discountPercent,
        priceAfterDiscount,
        image,
        quantity,
        size,
        color,
        images,
        status,
        message,
      ];

}

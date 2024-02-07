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
  late  num? userQuantity;
  final List<ProductSizesEntity>? size;
  final List<ProductColorsEntity>? color;
  final List<num>? sendSize;
  final List<num>? sendColor;
  final List<ProductsImagesEntity>? images;
  final List<String>? imagesBase64;
  final String? status;
  final String? message;

   ProductEntity({
    this.nameEn,
    this.nameAr,
    this.subCategoryId,
    this.descriptionEn,
    this.descriptionAr,
    this.code,
    this.priceAfterDiscount,
    this.image,
    this.imagesBase64,
    this.quantity,
    this.userQuantity=1,
    this.id,
    this.categoryId,
    this.price,
    this.discountPercent,
    this.size,
    this.color,
    this.sendColor,
    this.sendSize,
    this.images,
    this.status,
    this.message,
  });

  @override
  List<Object?> get props => [
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
    imagesBase64,
        quantity,
    userQuantity,
        size,
        color,
        sendColor,
        sendSize,
        images,
        status,
        message,
      ];
}

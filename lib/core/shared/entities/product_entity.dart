import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/products_images_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/designer/product/add_product/domain/entities/color_entity.dart';
import '../../../features/designer/product/add_product/domain/entities/size_entity.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 5)
class ProductEntity extends Equatable {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? nameEn;
  @HiveField(2)
  final String? nameAr;
  @HiveField(3)
  final num? categoryId;
  @HiveField(4)
  final num? subCategoryId;
  @HiveField(5)
  final String? descriptionEn;
  @HiveField(6)
  final String? descriptionAr;
  @HiveField(7)
  final String? code;
  @HiveField(8)
  final String? price;
  @HiveField(9)
  final int? discountPercent;
  @HiveField(10)
  final String? priceAfterDiscount;
  @HiveField(11)
  final String? image;
  @HiveField(12)
  final num? quantity;
  @HiveField(13)
  late num? userQuantity;

  @HiveField(14)
  final List<ProductSizesEntity>? size;
  @HiveField(15)
  final List<ProductColorsEntity>? color;
  @HiveField(16)
  final List<num>? sendSize;
  @HiveField(17)
  final List<num>? sendColor;
  @HiveField(18)
  final List<ProductsImagesEntity>? images;
  @HiveField(19)
  final List<String>? imagesBase64;
  @HiveField(20)
  final String? status;
  @HiveField(21)
  final String? message;
  @HiveField(22)
  final PivotEntity? pivot;

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
    this.userQuantity = 1,
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
    this.pivot,
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
        pivot,
      ];
}

@HiveType(typeId: 4)
class PivotEntity extends Equatable {
  @HiveField(0)
  final num? orderId;
  @HiveField(1)
  final num? productId;
  @HiveField(2)
  final num? quantity;
  @HiveField(3)
  final num? pricePerUnit;

  const PivotEntity({
    this.orderId,
    this.productId,
    this.quantity,
    this.pricePerUnit,
  });

  @override
  List<Object?> get props => [
        orderId,
        productId,
        quantity,
        pricePerUnit,
      ];
}

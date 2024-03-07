// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 5;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      nameEn: fields[1] as String?,
      nameAr: fields[2] as String?,
      subCategoryId: fields[4] as num?,
      descriptionEn: fields[5] as String?,
      descriptionAr: fields[6] as String?,
      code: fields[7] as String?,
      priceAfterDiscount: fields[10] as String?,
      image: fields[11] as String?,
      imagesBase64: (fields[19] as List?)?.cast<String>(),
      quantity: fields[12] as num?,
      userQuantity: fields[13] as num?,
      id: fields[0] as num?,
      categoryId: fields[3] as num?,
      price: fields[8] as String?,
      discountPercent: fields[9] as int?,
      size: (fields[14] as List?)?.cast<ProductSizesEntity>(),
      color: (fields[15] as List?)?.cast<ProductColorsEntity>(),
      sendColor: (fields[17] as List?)?.cast<num>(),
      sendSize: (fields[16] as List?)?.cast<num>(),
      images: (fields[18] as List?)?.cast<ProductsImagesEntity>(),
      status: fields[20] as String?,
      message: fields[21] as String?,
      pivot: fields[22] as PivotEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameAr)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.subCategoryId)
      ..writeByte(5)
      ..write(obj.descriptionEn)
      ..writeByte(6)
      ..write(obj.descriptionAr)
      ..writeByte(7)
      ..write(obj.code)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.discountPercent)
      ..writeByte(10)
      ..write(obj.priceAfterDiscount)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.quantity)
      ..writeByte(13)
      ..write(obj.userQuantity)
      ..writeByte(14)
      ..write(obj.size)
      ..writeByte(15)
      ..write(obj.color)
      ..writeByte(16)
      ..write(obj.sendSize)
      ..writeByte(17)
      ..write(obj.sendColor)
      ..writeByte(18)
      ..write(obj.images)
      ..writeByte(19)
      ..write(obj.imagesBase64)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(21)
      ..write(obj.message)
      ..writeByte(22)
      ..write(obj.pivot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PivotEntityAdapter extends TypeAdapter<PivotEntity> {
  @override
  final int typeId = 4;

  @override
  PivotEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PivotEntity(
      orderId: fields[0] as num?,
      productId: fields[1] as num?,
      quantity: fields[2] as num?,
      pricePerUnit: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, PivotEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.orderId)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.pricePerUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PivotEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

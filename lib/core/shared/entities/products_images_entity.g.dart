// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_images_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsImagesEntityAdapter extends TypeAdapter<ProductsImagesEntity> {
  @override
  final int typeId = 3;

  @override
  ProductsImagesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsImagesEntity(
      id: fields[0] as num?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsImagesEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsImagesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductSizesEntityAdapter extends TypeAdapter<ProductSizesEntity> {
  @override
  final int typeId = 1;

  @override
  ProductSizesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductSizesEntity(
      id: fields[0] as num?,
      nameAr: fields[1] as String?,
      nameEn: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductSizesEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameAr)
      ..writeByte(2)
      ..write(obj.nameEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSizesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductColorsEntityAdapter extends TypeAdapter<ProductColorsEntity> {
  @override
  final int typeId = 2;

  @override
  ProductColorsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductColorsEntity(
      id: fields[0] as num?,
      nameAr: fields[1] as String?,
      nameEn: fields[2] as String?,
      color: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductColorsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameAr)
      ..writeByte(2)
      ..write(obj.nameEn)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductColorsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

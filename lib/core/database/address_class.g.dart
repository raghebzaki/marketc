// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 0;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      address: fields[1] as String?,
      building: fields[2] as String?,
      flat: fields[3] as String?,
      country: fields[4] as String?,
      city: fields[5] as String?,
      code: fields[6] as String?,
      phone: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.building)
      ..writeByte(3)
      ..write(obj.flat)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.code)
      ..writeByte(7)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:marketc/core/utils/extensions.dart';

import 'address_class.dart';

class AddressTypeAdapter extends TypeAdapter<Address> {
  @override
  Address read(BinaryReader reader) {
    return Address(
      address: reader.readString(),
      building: reader.readString(),
      flat: reader.readString(),
      phone: reader.readString(),
      state: reader.readString(),
      city: reader.readString(),
      code: reader.readString(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Address obj) {
    writer.writeString(obj.address.isNullOrEmpty());
    writer.writeString(obj.building.isNullOrEmpty());
    writer.writeString(obj.flat.isNullOrEmpty());
    writer.writeString(obj.phone.isNullOrEmpty());
    writer.writeString(obj.state.isNullOrEmpty());
    writer.writeString(obj.city.isNullOrEmpty());
    writer.writeString(obj.code.isNullOrEmpty());
  }
}

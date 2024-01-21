import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Address extends Equatable {
  final String? id;
  final String? address;
  final String? building;
  final String? flat;
  final String? state;
  final String? city;
  final String? code;
  final String? phone;

  Address({
    this.address,
    this.building,
    this.flat,
    this.state,
    this.city,
    this.code,
    this.phone,
  }) : id = const Uuid().v4();

  @override
  List<Object?> get props => [
        id,
        address,
        building,
        flat,
        state,
        city,
        code,
        phone,
      ];
}

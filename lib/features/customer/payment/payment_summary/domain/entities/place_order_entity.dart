import 'package:equatable/equatable.dart';

class PlaceOrderEntity extends Equatable {
  final num? status;
  final String? msg;
  final String? name;
  final String? phone;
  final String? address;
  final List<num>? productIds;

  const PlaceOrderEntity({
    this.status,
    this.msg,
    this.name,
    this.phone,
    this.address,
    this.productIds,
  });

  @override
  List<Object?> get props => [
        status,
        msg,
        name,
        phone,
        address,
        productIds,
      ];
}

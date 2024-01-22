import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final num? id;
  final String? orderNumber;
  final String? address;
  final String? userName;
  final String? phone;
  final String? totalPrice;
  final String? date;
  final String? status;
  final String? message;

  const OrderEntity(
      {this.id,
      this.orderNumber,
      this.address,
      this.userName,
      this.phone,
      this.totalPrice,
      this.date,
      this.status,
      this.message});

  @override
  List<Object?> get props => [
        id,
        orderNumber,
        address,
        userName,
        phone,
        totalPrice,
        date,
        status,
        message,
      ];
}

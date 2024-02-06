import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

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
  final List<ProductEntity>? products;

  const OrderEntity(
      {this.id,
      this.orderNumber,
      this.address,
      this.userName,
      this.phone,
      this.totalPrice,
      this.date,
      this.status,
      this.message,
      this.products,});

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
    products,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

class OrderEntity extends Equatable {
  final num? id;
  final num? userId;
  final num? orderFilter;
  final String? orderNumber;
  final String? address;
  final String? userName;
  final String? phone;
  final num? totalPrice;
  final String? date;
  final int? status;
  final String? message;
  final List<ProductEntity>? products;

  const OrderEntity(
      {this.id,
      this.userId,
      this.orderFilter,
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
        userId,
        orderFilter,
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

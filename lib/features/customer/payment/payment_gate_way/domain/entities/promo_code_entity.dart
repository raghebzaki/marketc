import 'package:equatable/equatable.dart';

class PromoCodeEntity extends Equatable {
  final num? userId;
  final String? coupon;
  final bool? statusCode;
  final String? message;
  final DataEntity? couponData;

  const PromoCodeEntity({
    this.userId,
    this.coupon,
    this.statusCode,
    this.message,
    this.couponData,
  });

  @override
  List<Object?> get props => [
        userId,
        coupon,
        statusCode,
        message,
    couponData,
      ];
}

class DataEntity extends Equatable {
  final int? id;
  final String? name;
  final int? discount;
  final String? expireDate;
  final int? status;


  const DataEntity({
    this.id,
    this.name,
    this.discount,
    this.expireDate,
    this.status,


  });

  @override
  List<Object?> get props => [
        id,
        name,
        discount,
        expireDate,
        status,
      ];


}

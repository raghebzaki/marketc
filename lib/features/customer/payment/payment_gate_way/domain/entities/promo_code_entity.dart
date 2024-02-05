import 'package:equatable/equatable.dart';

class PromoCodeEntity extends Equatable {
  final int? userId;
  final String? coupon;
  final int? status;
  final String? message;

  const PromoCodeEntity({this.userId, this.coupon, this.status, this.message});

  @override
  List<Object?> get props => [
        userId,
        status,
        message,
      ];
}

import 'package:equatable/equatable.dart';

class BuySubscriptionEntity extends Equatable {
  final num? packageId;
  final num? userId;
  final num? status;
  final String? msg;
  final String? paymentUrl;

  const BuySubscriptionEntity({
    this.packageId,
    this.userId,
    this.status,
    this.msg,
    this.paymentUrl,
  });

  @override
  List<Object?> get props => [
        packageId,
        userId,
        status,
        msg,
        paymentUrl,
      ];


}

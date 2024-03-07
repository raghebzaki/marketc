
import '../../domain/entity/buy_subscription_entity.dart';

class BuySubscriptionModel extends BuySubscriptionEntity {
  const BuySubscriptionModel({
    super.packageId,
    super.userId,
    super.status,
    super.msg,
    super.paymentUrl,
  });

  factory BuySubscriptionModel.fromJson(Map<String, dynamic> json) {
    return BuySubscriptionModel(
      status: json['status'],
      msg: json['message'],
      paymentUrl: json['payment_url'],
    );
  }

  static Map<String, dynamic> toJson(BuySubscriptionEntity buySubscriptionEntity) {
    return {
      'packageId': buySubscriptionEntity.packageId,
      'userId': buySubscriptionEntity.userId,

    };
  }



}
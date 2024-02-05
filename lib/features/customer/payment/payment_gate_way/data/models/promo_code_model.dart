import '../../domain/entities/promo_code_entity.dart';

class PromoCodeModel extends PromoCodeEntity {
  const PromoCodeModel({
    super.userId,
    super.coupon,
    super.status,
    super.message,
  });

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      status: json["status"],
      message: json["message"],
    );
  }

  static Map<String, dynamic> toJson(PromoCodeEntity promoCodeEntity) {
    return {
      // "user_id": promoCodeEntity.userId,
      "coupon": promoCodeEntity.coupon,
    };
  }
}

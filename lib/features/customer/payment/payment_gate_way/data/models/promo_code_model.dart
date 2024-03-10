import '../../domain/entities/promo_code_entity.dart';

class PromoCodeModel extends PromoCodeEntity {
  const PromoCodeModel(
      {super.userId,
      super.coupon,
      super.statusCode,
      super.message,
      super.couponData});

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      statusCode: json["status"],
      message: json["message"],
      couponData: DataModel.fromJson(json["data"]),
    );
  }

  static Map<String, dynamic> toJson(PromoCodeEntity promoCodeEntity) {
    return {
      "user_id": promoCodeEntity.userId,
      "coupon": promoCodeEntity.coupon,
    };
  }
}

class DataModel extends DataEntity {
  const DataModel({
    super.id,
    super.name,
    super.discount,
    super.expireDate,
    super.status,
  });

  factory DataModel.fromJson(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      name: map['name'],
      discount: map['discount'],
      expireDate: map['expire_date'],
      status: map['status'],
    );
  }
}


import '../../domain/entity/subscription_entity.dart';

class SubscriptionsModel extends SubscriptionsEntity {
  const SubscriptionsModel({
    super.nextPage,
    super.packageData,
  });

  factory SubscriptionsModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionsModel(
      packageData: json["data"] == null
          ? []
          : List<PackageDataModel>.from(
              json["data"]!.map(
                (x) => PackageDataModel.fromJson(x),
              ),
            ),
    );
  }



  static Map<String, dynamic> toJson(SubscriptionsEntity subscriptionEntity) {
    return {
      'page': subscriptionEntity.nextPage,
    };
  }

}

class PackageDataModel extends PackageDataEntity {
  const PackageDataModel({
    super.packageName,
    super.packagePrice,
    super.packageBenefits,
    super.packageDiscountPrice,
  });


  factory PackageDataModel.fromJson(Map<String, dynamic> json) {
    return PackageDataModel(
      packageName: json['package_name'],
      packagePrice: json['package_price'],
      packageBenefits: json['package_benefits'],
      packageDiscountPrice: json['package_discount_price'],
    );
  }
}

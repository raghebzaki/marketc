
import '../../domain/entity/subscription_entity.dart';

class SubscriptionsModel extends SubscriptionsEntity {
  const SubscriptionsModel({
    super.nextPage,
    super.packageData,
  });

  factory SubscriptionsModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionsModel(
      packageData: json["data"]['data'] == null
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
    super.id,
    super.packageNameAr,
    super.packageNameEn,
    super.packageType,
    super.feature1,
    super.feature2,
    super.feature3,
    super.feature4,
    super.feature5,
    super.feature6,
    super.description,
    super.price,
  });


  factory PackageDataModel.fromJson(Map<String, dynamic> json) {
    return PackageDataModel(
      id: json['id'],
      packageNameAr: json['name_ar'],
      packageNameEn: json['name_en'],
      packageType: json['package_type'],
      feature1: json['feature_1'] ?? "",
      feature2: json['feature_2'] ?? "",
      feature3: json['feature_3'] ?? "",
      feature4: json['feature_4'] ?? "",
      feature5: json['feature_5'] ?? "",
      feature6: json['feature_6'] ?? "",
      description: json['desc'],
      price: json['price'],
    );
  }
}

import 'package:equatable/equatable.dart';

class SubscriptionsEntity extends Equatable {
  final num? nextPage;
  final List<PackageDataEntity>? packageData;

  const SubscriptionsEntity({
    this.nextPage = 1,
    this.packageData,
  });

  @override
  List<Object?> get props => [
        nextPage,
    packageData,
      ];
}

class PackageDataEntity extends Equatable {
  final String? packageName;
  final String? packagePrice;
  final List<String>? packageBenefits;
  final String? packageDiscountPrice;

  const PackageDataEntity({
    this.packageName,
    this.packagePrice,
    this.packageBenefits,
    this.packageDiscountPrice,
  });

  @override
  List<Object?> get props => [
        packageName,
        packagePrice,
        packageBenefits,
        packageDiscountPrice,
      ];
}

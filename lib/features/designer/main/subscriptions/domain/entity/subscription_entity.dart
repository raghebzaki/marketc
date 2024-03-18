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
  final num? id;
  final String? packageNameAr;
  final String? packageNameEn;
  final num? packageType;
  final String? feature1;
  final String? feature2;
  final String? feature3;
  final String? feature4;
  final String? feature5;
  final String? feature6;
  final String? description;
  final num? price;

  const PackageDataEntity({
    this.id,
    this.packageNameAr,
    this.packageNameEn,
    this.packageType,
    this.feature1,
    this.feature2,
    this.feature3,
    this.feature4,
    this.feature5,
    this.feature6,
    this.description,
    this.price,
  });

  @override
  List<Object?> get props => [
        id,
        packageNameAr,
        packageNameEn,
        packageType,
        feature1,
        feature2,
        feature3,
        feature4,
        feature5,
        feature6,
        description,
        price,
      ];
}

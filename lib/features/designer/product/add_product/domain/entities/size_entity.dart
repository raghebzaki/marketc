import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'size_entity.g.dart';

@HiveType(typeId: 1)
class ProductSizesEntity extends Equatable {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? nameAr;
  @HiveField(2)
  final String? nameEn;

  const ProductSizesEntity({
    this.id,
    this.nameAr,
    this.nameEn,
  });

  @override
  List<Object?> get props => [
    id,
    nameAr,
    nameEn,
  ];


}

import 'package:equatable/equatable.dart';

class ProductSizesEntity extends Equatable {
  final num? id;
  final String? nameAr;
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

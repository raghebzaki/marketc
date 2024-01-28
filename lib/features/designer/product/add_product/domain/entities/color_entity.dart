import 'package:equatable/equatable.dart';

class ProductColorsEntity extends Equatable {
  final num? id;
  final String? nameAr;
  final String? nameEn;
  final String? color;

  const ProductColorsEntity({
    this.id,
    this.nameAr,
    this.nameEn,
    this.color,
  });

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        color,
      ];


}

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'color_entity.g.dart';

@HiveType(typeId: 2)
class ProductColorsEntity extends Equatable {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? nameAr;
  @HiveField(2)
  final String? nameEn;
  @HiveField(3)
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

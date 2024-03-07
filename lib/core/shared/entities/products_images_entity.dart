import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'products_images_entity.g.dart';

@HiveType(typeId: 3)
class ProductsImagesEntity extends Equatable {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? image;

  const ProductsImagesEntity({this.id, this.image});

  @override
  List<Object?> get props => [id, image];
}
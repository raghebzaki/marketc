import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final num? id;
  final String? name;
  final num? categoryId;
  final String? description;
  final String? price;
  final String? discountPercent;
  final List<String>? size;
  final List<String>? color;
  final List<String>? images;
  final String? status;
  final String? message;

  const ProductEntity({this.id, this.name, this.categoryId, this.description,
    this.price, this.discountPercent, this.size, this.color, this.images,this.status, this.message, });

  @override
  List<Object?> get props =>
      [
        id,
        name,
        categoryId,
        description,
        price,
        discountPercent,
        size,
        color,
        images,
        status,
        message,
      ];
}
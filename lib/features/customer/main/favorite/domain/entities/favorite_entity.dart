import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

class FavoriteEntity extends Equatable {
  final int? id;
  final int? userId;
  final int? productId;
  final ProductEntity? product;

  const FavoriteEntity(
      {this.id,
      this.userId,
      this.productId,
      this.product});

  @override
  List<Object?> get props => [
        id,
        userId,
        productId,
        product,
      ];
}

import 'package:equatable/equatable.dart';

import '../../../../../../core/shared/entities/product_entity.dart';

class MyDesignerProductsEntity extends Equatable {
  final num? userId;
  final num? nextPage;
  final List<ProductEntity>? products;

  const MyDesignerProductsEntity({
    this.userId,
    this.nextPage,
    this.products,
  });

  @override
  List<Object?> get props => [
        userId,
        nextPage,
        products,
      ];
}

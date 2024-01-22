import 'package:equatable/equatable.dart';

import '../../../../../../core/shared/entities/product_entity.dart';



class CategoryDetailsEntity extends Equatable {
  final num? categoryId;
  final num? filterId;
  final num? nextPage;
  final List<ProductEntity>? products;

  const CategoryDetailsEntity({
    this.categoryId,
    this.filterId,
    this.nextPage,
    this.products,
  });

  @override
  List<Object?> get props => [
        categoryId,
        filterId,
        nextPage,
        products,
      ];
}

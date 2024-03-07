import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

class SearchEntity extends Equatable {
  final String? searchText;
  final int? nextPage;
  final List<ProductEntity>? products;

  const SearchEntity({
    this.searchText,
    this.products,
    this.nextPage,
  });

  @override
  List<Object?> get props => [
        searchText,
    products,
    nextPage,
      ];


}

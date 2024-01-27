import 'package:equatable/equatable.dart';

class ProductSizesEntity extends Equatable {
  final num? id;

  const ProductSizesEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];


}

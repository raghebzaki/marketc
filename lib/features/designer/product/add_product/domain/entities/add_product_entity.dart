import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

class AddProductEntity extends Equatable {
  final num? status;
  final String? msg;
  final ProductEntity? product;

  const AddProductEntity({
    this.status,
    this.msg,
    this.product,
  });

  @override
  List<Object?> get props => [
        status,
        msg,
        product,
      ];
}

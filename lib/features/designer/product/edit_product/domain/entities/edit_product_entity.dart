import 'package:equatable/equatable.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

class EditProductEntity extends Equatable {
  final num? status;
  final String? msg;
  final ProductEntity? product;

  const EditProductEntity({
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

import 'package:equatable/equatable.dart';

class DeleteProductEntity extends Equatable {
  final num? productId;
  final num? status;
  final String? msg;

  const DeleteProductEntity({
    this.productId,
    this.status,
    this.msg,
  });

  @override
  List<Object?> get props => [
        productId,
        status,
        msg,
      ];
}

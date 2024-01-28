import 'package:equatable/equatable.dart';

class AddFavoriteEntity extends Equatable {
  final num? userId;
  final num? productId;
  final num? status;
  final String? msg;

  const AddFavoriteEntity({
    this.userId,
    this.productId,
    this.status,
    this.msg,
  });

  @override
  List<Object?> get props => [
        userId,
        productId,
        status,
        msg,
      ];


}

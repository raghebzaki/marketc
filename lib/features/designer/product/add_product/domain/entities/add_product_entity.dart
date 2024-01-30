import 'package:equatable/equatable.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/models/user_data_model.dart';

class AddProductEntity extends Equatable {
  final num? designerId;
  final num? status;
  final String? msg;
  final ProductEntity? product;

  AddProductEntity({
    this.status,
    this.msg,
    this.product,
  }) : designerId = UserData.id;

  @override
  List<Object?> get props => [
        status,
        msg,
        product,
      ];
}

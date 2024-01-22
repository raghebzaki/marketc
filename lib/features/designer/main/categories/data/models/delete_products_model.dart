
import '../../domain/entities/delete_product_entity.dart';

class DeleteProductModel extends DeleteProductEntity {
  const DeleteProductModel({
    super.productId,
    super.status,
    super.msg,
  });

  factory DeleteProductModel.fromJson(Map<String, dynamic> map) {
    return DeleteProductModel(
      status: map['status'] as num,
      msg: map['msg'] as String,
    );
  }

  static Map<String, dynamic> toJson(DeleteProductEntity deleteProductEntity) {
    return {
      'product_id': deleteProductEntity.productId,
    };
  }
}

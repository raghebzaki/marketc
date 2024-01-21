import '../../domain/entities/place_order_entity.dart';

class PlaceOrderModel extends PlaceOrderEntity {
  const PlaceOrderModel({
    super.status,
    super.msg,
    super.name,
    super.phone,
    super.address,
    super.productIds,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderModel(
      status: json['status'],
      msg: json['message'],
    );
  }

  static Map<String, dynamic> toJson(PlaceOrderEntity placeOrderEntity) {
    return {
      "name": placeOrderEntity.name,
      "phone": placeOrderEntity.phone,
      "address": placeOrderEntity.address,
      "productIds": placeOrderEntity.productIds,
    };
  }
}

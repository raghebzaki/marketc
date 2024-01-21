import 'package:marketc/core/shared/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
      super.id,
      super.orderNumber,
      super.address,
      super.userName,
      super.phone,
      super.totalPrice,
      super.date,
      super.status,
      super.message,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"] ,
      orderNumber: json["order_number"],
      address: json["address"],
      phone: json["phone"] ,
      userName: json["name"],
      totalPrice: json["total_price"],
      date: json["date"] ,
    );
  }
 factory OrderModel.addOrderFromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json["status"] ,
      message: json["message"],
    );
  }

  static Map<String, dynamic> addOrderToJson(OrderEntity orderEntity) {
    return {
      'id': orderEntity.id,
      'address': orderEntity.address,
      'phone': orderEntity.phone,
      'userName': orderEntity.userName,
    };
  }
}

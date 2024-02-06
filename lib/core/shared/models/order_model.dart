import 'package:marketc/core/shared/entities/order_entity.dart';
import 'package:marketc/core/shared/models/product_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    super.id,
    super.userId,
    super.orderFilter,
    super.orderNumber,
    super.address,
    super.userName,
    super.phone,
    super.totalPrice,
    super.date,
    super.status,
    super.message,
    super.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      status: json["status"],
      orderNumber: json["order_number"],
      totalPrice: json["total_amount"],
      date: json["created_at"],
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(
              json["products"]!.map(
                (x) => ProductModel.fromJson(x),
              ),
            ),
    );
  }
  static Map<String, dynamic> dataToJson(OrderEntity orderEntity) {
    return {
      "user_id": orderEntity.userId,
    };
  }
  static Map<String, dynamic> queryToJson(OrderEntity orderEntity) {
    return {
      "filters[status][eq]": orderEntity.orderFilter,
    };
  }
  factory OrderModel.addOrderFromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json["status"],
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

import '../../../../../../core/shared/models/order_model.dart';
import '../../domain/entities/my_orders_entity.dart';

class MyOrdersModel extends MyOrdersEntity {
  const MyOrdersModel({
    super.userId,
    super.orderFilter,
    super.orders,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) {
    return MyOrdersModel(
      orders: json["products"] == null
          ? []
          : List<OrderModel>.from(
              json["products"]!.map(
                (x) => OrderModel.fromJson(x),
              ),
            ),
    );
  }

  static Map<String, dynamic> toJson(MyOrdersEntity myOrdersEntity) {
    return {
      "userId": myOrdersEntity.userId,
      "orderFilter": myOrdersEntity.orderFilter,
    };
  }
}

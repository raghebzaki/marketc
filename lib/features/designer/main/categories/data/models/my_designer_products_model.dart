import '../../../../../../core/shared/models/product_model.dart';
import '../../domain/entities/my_designer_products_entity.dart';

class MyDesignerProductsModel extends MyDesignerProductsEntity {
  const MyDesignerProductsModel({
    super.userId,
    super.nextPage,
    super.products,
  });

  factory MyDesignerProductsModel.fromJson(Map<String, dynamic> json) {
    return MyDesignerProductsModel(
      products: json["data"] == null
          ? []
          : List<ProductModel>.from(
          json["data"]!.map((x) => ProductModel.fromJson(x))),
    );
  }

  static Map<String, dynamic> toJson(
      MyDesignerProductsEntity myDesignerProductsEntity) {
    return {
      'userId': myDesignerProductsEntity.userId,
      'nextPage': myDesignerProductsEntity.nextPage,
    };
  }
}

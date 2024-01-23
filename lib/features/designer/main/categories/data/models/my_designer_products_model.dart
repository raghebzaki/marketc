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
      products: (json['products'] as List<ProductModel>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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

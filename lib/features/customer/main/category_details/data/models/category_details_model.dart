import '../../../../../../core/shared/models/product_model.dart';
import '../../domain/entities/category_details_entity.dart';

class CategoryDetailsModel extends CategoryDetailsEntity {
  const CategoryDetailsModel({
    super.categoryId,
    super.filterId,
    super.nextPage,
    super.products,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      products: json["data"]["data"] == null
          ? []
          : List<ProductModel>.from(
              json["data"]["data"]!.map(
                (x) => ProductModel.fromJson(x),
              ),
            ),
    );
  }

  static Map<String, dynamic> toJson(
      CategoryDetailsEntity categoryDetailsEntity) {
    return {
      "category_id" : categoryDetailsEntity.categoryId,
      "sub_category_id": categoryDetailsEntity.filterId,
      "page": categoryDetailsEntity.nextPage,
    };
  }
}

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
      categoryId: json["category_id"] ?? 0,
      filterId: json['filter_id'] ?? 0,
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(
              json["products"]!.map(
                (x) => ProductModel.fromJson(x),
              ),
            ),
    );
  }

  static Map<String, dynamic> toJson(
      CategoryDetailsEntity categoryDetailsEntity) {
    return {
      "category_id": categoryDetailsEntity.categoryId,
      "filter_id": categoryDetailsEntity.filterId,
      "page": categoryDetailsEntity.nextPage,
    };
  }
}

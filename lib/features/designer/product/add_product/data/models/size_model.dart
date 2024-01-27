import '../../domain/entities/size_entity.dart';

class ProductSizesModel extends ProductSizesEntity {
  const ProductSizesModel({
    super.id,
  });

  factory ProductSizesModel.fromJson(Map<String, dynamic> map) {
    return ProductSizesModel(
      id: map['id'] as num,
    );
  }

  Map<String, dynamic> toJson(ProductSizesEntity productSizesEntity) {
    return {
      'id': productSizesEntity.id,
    };
  }
}

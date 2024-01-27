import 'package:marketc/features/designer/product/add_product/domain/entities/color_entity.dart';

class ProductColorsModel extends ProductColorsEntity {
  const ProductColorsModel({
    super.id,
  });

  factory ProductColorsModel.fromJson(Map<String, dynamic> map) {
    return ProductColorsModel(
      id: map['id'] as num,
    );
  }

  Map<String, dynamic> toJson(ProductColorsEntity productColorsEntity) {
    return {
      'id': productColorsEntity.id,
    };
  }
}

import 'package:marketc/features/designer/product/add_product/domain/entities/color_entity.dart';

class ProductColorsModel extends ProductColorsEntity {
  const ProductColorsModel({
    super.id,
    super.nameAr,
    super.nameEn,
    super.color,

  });

  factory ProductColorsModel.fromJson(Map<String, dynamic> map) {
    return ProductColorsModel(
      id: map['id'] ,
      nameEn: map['name_en'] ,
      nameAr: map['name_ar'] ,
      color: map['color_code'] ,
    );
  }

  Map<String, dynamic> toJson(ProductColorsEntity productColorsEntity) {
    return {
      'id': productColorsEntity.id,
    };
  }
}

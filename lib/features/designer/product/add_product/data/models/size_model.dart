import '../../domain/entities/size_entity.dart';

class ProductSizesModel extends ProductSizesEntity {
  const ProductSizesModel({
    super.id,
    super.nameAr,
    super.nameEn,

  });

  factory ProductSizesModel.fromJson(Map<String, dynamic> map) {
    return ProductSizesModel(
      id: map['id'],
      nameEn: map['name_en'],
      nameAr: map['name_ar'],
    );
  }

  Map<String, dynamic> toJson(ProductSizesEntity productSizesEntity) {
    return {
      'id': productSizesEntity.id,
    };
  }
}

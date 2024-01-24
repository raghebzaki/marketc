import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final num? id;
  final String? nameEn;
  final String? nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final String? image;

  const CategoryEntity(
      {this.nameAr, this.descriptionEn, this.descriptionAr, this.id, this.nameEn, this.image});

  @override
  List<Object?> get props =>
      [id, nameEn, nameAr, descriptionEn, descriptionAr, image,];
}

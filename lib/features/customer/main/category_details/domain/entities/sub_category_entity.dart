import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final num? id;
  final String? nameEn;
  final String? nameAr;


  const SubCategoryEntity(
      {this.nameAr, this.id, this.nameEn,});

  @override
  List<Object?> get props =>
      [id, nameEn, nameAr, ];
}

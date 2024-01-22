import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final num? id;
  final String? name;
  final String? image;

  const CategoryEntity({this.id, this.name, this.image});

  @override
  List<Object?> get props => [id, name, image];
}

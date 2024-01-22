import 'package:equatable/equatable.dart';

class DesignerCarouselEntity extends Equatable {
  final num? id;
  final String? title;
  final String? description;
  final String? image;

  const DesignerCarouselEntity({this.id, this.title, this.description, this.image});

  @override
  List<Object?> get props => [id, title, description, image];
}

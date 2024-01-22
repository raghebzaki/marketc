import 'package:equatable/equatable.dart';

class DesignsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;


  const DesignsEntity(
      {
      this.id,
      this.name,
      this.image,
      });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}

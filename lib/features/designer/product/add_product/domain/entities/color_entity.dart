import 'package:equatable/equatable.dart';

class ProductColorsEntity extends Equatable {
  final num? id;

  const ProductColorsEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];


}

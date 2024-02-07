import 'package:equatable/equatable.dart';

class GetPointsEntity extends Equatable {
  final num? id;
  final String? code;
  final String? price;
  final String? date;

  const GetPointsEntity({this.id, this.code, this.price, this.date});

  @override
  List<Object?> get props => [id, code, price, date];
}

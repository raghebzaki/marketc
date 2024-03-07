import 'package:equatable/equatable.dart';

class UserBalanceEntity extends Equatable {
  final num? id;
  final num? userId;
  final String? status;
  final num? amount;
  final String? date;

  const UserBalanceEntity({
    this.id,
    this.userId,
    this.status,
    this.amount,
    this.date,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        status,
        amount,
        date,
      ];


}

import 'package:equatable/equatable.dart';

class BalanceEntity extends Equatable {
  final int? userId;
  final int? status;
  final String? message;

  const BalanceEntity(
      {
      this.userId,
      this.status,
      this.message});

  @override
  List<Object?> get props => [
        userId,
        status,
        message,
      ];
}

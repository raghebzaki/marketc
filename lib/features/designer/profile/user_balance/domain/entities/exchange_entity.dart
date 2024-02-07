import 'package:equatable/equatable.dart';

class ExchangeEntity extends Equatable {
  final int? userId;

  final int? status;
  final String? message;

  const ExchangeEntity(
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

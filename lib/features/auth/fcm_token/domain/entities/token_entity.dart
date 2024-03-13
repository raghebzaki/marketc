import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final num? userId;
  final String? token;
  final num? status;
  final String? msg;

  const TokenEntity({
    this.userId,
    this.token,
    this.status,
    this.msg,
  });

  @override
  List<Object?> get props => [
        userId,
        token,
        status,
        msg,
      ];
}

import 'package:equatable/equatable.dart';

class DesignsEntity extends Equatable {
  final int? userId;
  final String? name;
  final String? email;
  final int? status;
  final String? message;

  const DesignsEntity(
      {
      this.userId,
      this.name,
      this.email,
      this.status,
      this.message});

  @override
  List<Object?> get props => [
        userId,
        name,
        email,
        status,
        message,
      ];
}

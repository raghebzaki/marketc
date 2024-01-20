import 'package:equatable/equatable.dart';

import '../../../../../core/shared/models/user_data_model.dart';

class LoginEntity extends Equatable {
  final num? status;
  final String? msg;
  final UserData? userData;

  const LoginEntity({
    this.status,
    this.msg,
    this.userData,
  });

  @override
  List<Object?> get props => [
        status,
        msg,
        userData,
      ];
}

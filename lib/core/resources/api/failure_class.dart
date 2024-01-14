import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final num responseCode; // 200, 201, 400, 303..500 and so on
  final String responseMsg; // error , success

  const Failure(
    this.responseCode,
    this.responseMsg,
  );

  @override
  List<Object> get props => [
        responseCode,
        responseMsg,
      ];
}

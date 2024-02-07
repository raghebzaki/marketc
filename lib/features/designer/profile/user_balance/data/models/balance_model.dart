import '../../domain/entities/balance_entity.dart';

class BalanceModel extends BalanceEntity{
  const BalanceModel({
    super.userId,
    super.status,
    super.message,
  });


  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      status: json["status"] ,
      message: json["message"] ,
    );
  }

  static Map<String, dynamic> toJson(BalanceEntity balanceEntity) {
    return {
      'user_id': balanceEntity.userId,
    };
  }
}
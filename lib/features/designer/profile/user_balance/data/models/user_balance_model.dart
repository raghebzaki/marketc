
import '../../domain/entities/user_balance_entity.dart';

class UserBalanceModel extends UserBalanceEntity {

  const UserBalanceModel({
    super.id,
    super.userId,
    super.status,
    super.amount,
    super.date,
  });


  factory UserBalanceModel.fromJson(Map<String, dynamic> json) {
    return UserBalanceModel(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'] ?? "",
      amount: num.parse(json['amount']),
      date: json['created_at'],
    );
  }

  static Map<String, dynamic> getBalanceToJson(UserBalanceEntity userBalanceEntity) {
    return {
      'user_id': userBalanceEntity.userId,

    };
  }
  static Map<String, dynamic> withdrawToJson(UserBalanceEntity userBalanceEntity) {
    return {
      'user_id': userBalanceEntity.userId,
      'amount': userBalanceEntity.amount,
    };
  }

}
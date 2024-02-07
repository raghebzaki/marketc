import '../../domain/entities/exchange_entity.dart';

class ExchangeModel extends ExchangeEntity{
  const ExchangeModel({
    super.userId,
    super.status,
    super.message,
  });


  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    return ExchangeModel(
      status: json["status"] ,
      message: json["message"] ,
    );
  }

  static Map<String, dynamic> toJson(ExchangeEntity exchangeEntity) {
    return {
      'user_id': exchangeEntity.userId,
    };
  }
}
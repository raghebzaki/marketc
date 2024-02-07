
import '../../domain/entities/get_points_entity.dart';

class GetPointsModel extends GetPointsEntity{
  const GetPointsModel({
    super.id,
    super.code,
    super.price,
    super.date,

  });


  factory GetPointsModel.fromJson(Map<String, dynamic> json) {
    return GetPointsModel(
      id: json["id"] ,
      code: json["code"],
      price: json["price"] ,
      date: json["date"] ,
    );
  }
}
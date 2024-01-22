import '../../domain/entities/designs_entity.dart';

class DesignsModel extends DesignsEntity{
  const DesignsModel({
    super.userId,
    super.name,
    super.email,
    super.status,
    super.message,
  });


  factory DesignsModel.fromJson(Map<String, dynamic> json) {
    return DesignsModel(
      status: json["status"] ,
      message: json["message"] ,
    );
  }

  static Map<String, dynamic> toJson(DesignsEntity contactUsEntity) {
    return {
      'user_id': contactUsEntity.userId,
      'name': contactUsEntity.name,
      'email': contactUsEntity.email,
    };
  }
}
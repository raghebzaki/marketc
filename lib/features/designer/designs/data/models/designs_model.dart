import '../../domain/entities/designs_entity.dart';

class DesignsModel extends DesignsEntity{
  const DesignsModel({
    super.id,
    super.name,
    super.image,

  });


  factory DesignsModel.fromJson(Map<String, dynamic> json) {
    return DesignsModel(
      id: json["id"] ,
      name: json["name"] ,
      image: json["image"] ,
    );
  }


}
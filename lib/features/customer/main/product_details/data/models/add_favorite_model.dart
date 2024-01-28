
import '../../domain/entities/add_favorite_entity.dart';

class AddFavoriteModel extends AddFavoriteEntity {

  const AddFavoriteModel({
    super.userId,
    super.productId,
    super.status,
    super.msg,
  });

  factory AddFavoriteModel.fromJson(Map<String, dynamic> map) {
    return AddFavoriteModel(
      status: map['status'] ,
      msg: map['success'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productId': productId,
    };
  }

}
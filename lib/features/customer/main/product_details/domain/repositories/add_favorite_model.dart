import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/product_details/domain/entities/add_favorite_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';


abstract class AddFavoriteRepo {
  Future<Either<Failure, AddFavoriteEntity>> addProductToFavorites(num? userId,num? productId);

}

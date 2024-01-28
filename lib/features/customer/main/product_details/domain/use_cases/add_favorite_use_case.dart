import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/product_details/domain/entities/add_favorite_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/add_favorite_model.dart';

class AddFavoriteUseCase {
  final AddFavoriteRepo addFavoriteRepo;

  AddFavoriteUseCase({required this.addFavoriteRepo});

  Future<Either<Failure, AddFavoriteEntity>> call(
      num? userId, num? productId) async {
    return await addFavoriteRepo.addProductToFavorites(userId, productId);
  }
}

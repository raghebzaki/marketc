import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/product_details/domain/entities/add_favorite_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/add_favorite_model.dart';

class CheckIfFavoriteUseCase {
  final AddFavoriteRepo checkIfFavoriteRepo;

  CheckIfFavoriteUseCase({required this.checkIfFavoriteRepo});

  Future<Either<Failure, AddFavoriteEntity>> call(
      num? userId, num? productId) async {
    return await checkIfFavoriteRepo.checkIfProductFavorite(userId, productId);
  }
}

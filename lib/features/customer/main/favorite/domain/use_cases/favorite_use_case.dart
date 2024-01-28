import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/favorite/domain/entities/favorite_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/favorite_repo.dart';


class FavoriteUseCase {
  final FavoriteRepo favoriteRepo;

  FavoriteUseCase(this.favoriteRepo);

  Future<Either<Failure, List<FavoriteEntity>>> call(FavoriteEntity favoriteEntity) async {
    return await favoriteRepo.getAllProducts(favoriteEntity);
  }
}

import 'package:dartz/dartz.dart';
import 'package:marketc/core/shared/entity/product_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/most_popular_repo.dart';


class MostPopularUseCase {
  final MostPopularRepo mostPopularRepo;

  MostPopularUseCase(this.mostPopularRepo);

  Future<Either<Failure, List<ProductEntity>>> call(int? nextPage) async {
    return await mostPopularRepo.getAllProducts( nextPage);
  }
}

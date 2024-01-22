import 'package:dartz/dartz.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';


abstract class MostPopularRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts(int? nextPage);

}

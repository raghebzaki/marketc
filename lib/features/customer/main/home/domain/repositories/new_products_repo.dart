import 'package:dartz/dartz.dart';
import 'package:marketc/core/shared/entity/product_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';


abstract class NewProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts(int? nextPage);

}

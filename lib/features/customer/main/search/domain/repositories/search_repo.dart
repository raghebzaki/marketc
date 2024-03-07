import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../entities/search_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
      SearchEntity searchEntity);
}

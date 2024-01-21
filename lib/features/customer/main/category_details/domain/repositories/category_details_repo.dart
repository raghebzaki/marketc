import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/category_details_entity.dart';

abstract class CategoryDetailsRepo {
  Future<Either<Failure, CategoryDetailsEntity>> getCategoryProducts(
      CategoryDetailsEntity categoryDetailsEntity);
}

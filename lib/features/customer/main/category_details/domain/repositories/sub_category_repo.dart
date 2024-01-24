import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/sub_category_entity.dart';


abstract class SubCategoryRepo {
  Future<Either<Failure, List<SubCategoryEntity>>> getAllSubCategory();

}

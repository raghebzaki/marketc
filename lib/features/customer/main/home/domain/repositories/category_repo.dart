import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/home/domain/entities/category_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';


abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategory();

}

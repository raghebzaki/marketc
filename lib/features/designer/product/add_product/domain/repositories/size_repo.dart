
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/size_entity.dart';


abstract class SizesRepo {
  Future<Either<Failure, List<ProductSizesEntity>>> getSizes();
}
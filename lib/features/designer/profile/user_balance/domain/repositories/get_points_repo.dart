import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/get_points_entity.dart';


abstract class GetPointsRepo {
  Future<Either<Failure, List<GetPointsEntity>>> getAllPoints(num? userId);

}

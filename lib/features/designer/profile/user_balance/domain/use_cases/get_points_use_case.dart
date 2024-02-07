import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/get_points_entity.dart';
import '../repositories/get_points_repo.dart';


class GetPointsUseCase {
  final GetPointsRepo getPointsRepo;

  GetPointsUseCase(this.getPointsRepo);

  Future<Either<Failure, List<GetPointsEntity>>> call(num? userId) async {
    return await getPointsRepo.getAllPoints(userId);
  }
}

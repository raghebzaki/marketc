import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/designer_stats_entity.dart';
import '../repositories/designer_stats_repo.dart';

class DesignerStatsUseCase {
  final DesignerStatsRepo statsRepo;

  DesignerStatsUseCase({required this.statsRepo});

  Future<Either<Failure, DesignerStatsEntity>> call(
      DesignerStatsEntity designerStatsEntity) async {
    return await statsRepo.getDesignerStats(designerStatsEntity);
  }
}


import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/designer_stats_entity.dart';

abstract class DesignerStatsRepo {
  Future<Either<Failure, DesignerStatsEntity>> getDesignerStats(DesignerStatsEntity designerStatsEntity);
}

import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/designs_entity.dart';


abstract class DesignsRepo {
  Future<Either<Failure,List<DesignsEntity>>> getAllDesigns(int? nextPage);

}

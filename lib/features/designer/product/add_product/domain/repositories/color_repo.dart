
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/color_entity.dart';

abstract class ColorsRepo {
  Future<Either<Failure, List<ProductColorsEntity>>> getColors();
}
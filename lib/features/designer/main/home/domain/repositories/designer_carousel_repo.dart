import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/designer_carousel_entity.dart';


abstract class DesignerCarouselRepo {
  Future<Either<Failure, List<DesignerCarouselEntity>>> getAllCarousel(int nextPage);

}

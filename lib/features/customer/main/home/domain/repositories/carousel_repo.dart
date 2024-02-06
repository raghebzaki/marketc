import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/home/domain/entities/carousel_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';


abstract class CarouselRepo {
  Future<Either<Failure, List<CarouselEntity>>> getAllCarousel(int nextPage);

}

import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/home/domain/entities/carousel_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/carousel_repo.dart';


class CarouselUseCase {
  final CarouselRepo carouselRepo;

  CarouselUseCase(this.carouselRepo);

  Future<Either<Failure, List<CarouselEntity>>> call() async {
    return await carouselRepo.getAllCarousel();
  }
}

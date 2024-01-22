import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/designer_carousel_entity.dart';
import '../repositories/designer_carousel_repo.dart';


class DesignerCarouselUseCase {
  final DesignerCarouselRepo carouselRepo;

  DesignerCarouselUseCase(this.carouselRepo);

  Future<Either<Failure, List<DesignerCarouselEntity>>> call() async {
    return await carouselRepo.getAllCarousel();
  }
}

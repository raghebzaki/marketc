import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/color_entity.dart';
import '../repositories/color_repo.dart';

class ColorsUseCase {
final ColorsRepo colorsRepo;

  ColorsUseCase({required this.colorsRepo});

  Future<Either<Failure, List<ProductColorsEntity>>> call() async {
    return await colorsRepo.getColors();
  }

}
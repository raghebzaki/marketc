import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/size_entity.dart';
import '../repositories/size_repo.dart';

class SizesUseCase {
  final SizesRepo sizesRepo;

  SizesUseCase({required this.sizesRepo});

  Future<Either<Failure, List<ProductSizesEntity>>> call() async {
    return await sizesRepo.getSizes();
  }

}
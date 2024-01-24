import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/sub_category_entity.dart';
import '../repositories/sub_category_repo.dart';


class SubCategoryUseCase {
  final SubCategoryRepo subCategoryRepo;

  SubCategoryUseCase(this.subCategoryRepo);

  Future<Either<Failure, List<SubCategoryEntity>>> call() async {
    return await subCategoryRepo.getAllSubCategory();
  }
}

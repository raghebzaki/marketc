import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/main/home/domain/repositories/category_repo.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/category_entity.dart';


class CategoryUseCase {
  final CategoryRepo categoryRepo;

  CategoryUseCase(this.categoryRepo);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await categoryRepo.getAllCategory();
  }
}

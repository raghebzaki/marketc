import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/category_details_entity.dart';
import '../repositories/category_details_repo.dart';

class GetCategoryProductsUseCase {
  final CategoryDetailsRepo categoryDetailsRepo;

  GetCategoryProductsUseCase({required this.categoryDetailsRepo});

  Future<Either<Failure, CategoryDetailsEntity>> call(CategoryDetailsEntity categoryDetailsEntity) async {
    return await categoryDetailsRepo.getCategoryProducts(categoryDetailsEntity);
  }
}

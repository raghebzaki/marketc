import 'package:dartz/dartz.dart';
import 'package:marketc/core/shared/entity/product_entity.dart';
import 'package:marketc/features/customer/main/home/domain/repositories/new_products_repo.dart';

import '../../../../../../core/resources/api/failure_class.dart';


class NewProductsUseCase {
  final NewProductsRepo newProductsRepo;

  NewProductsUseCase(this.newProductsRepo);

  Future<Either<Failure, List<ProductEntity>>> call(int? nextPage) async {
    return await newProductsRepo.getAllProducts( nextPage);
  }
}

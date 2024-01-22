import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/my_designer_products_entity.dart';
import '../repositories/my_designer_products_repo.dart';

class MyDesignerProductsUseCase {
  final MyDesignerProductsRepo myDesignerProductsRepo;

  MyDesignerProductsUseCase({required this.myDesignerProductsRepo});

  Future<Either<Failure, MyDesignerProductsEntity>> call(
      MyDesignerProductsEntity myDesignerProductsEntity) async {
    return await myDesignerProductsRepo.myProducts(myDesignerProductsEntity);
  }
}

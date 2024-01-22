import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/add_product_entity.dart';
import '../repositories/add_product_repo.dart';

class AddProductUseCase {
  final AddProductRepo addProductRepo;

  AddProductUseCase({required this.addProductRepo});


  Future<Either<Failure, AddProductEntity>> call(AddProductEntity addProductEntity) async {
    return await addProductRepo.addProduct(addProductEntity);
  }

}
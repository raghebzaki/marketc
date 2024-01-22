import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/edit_product_entity.dart';
import '../repositories/edit_product_repo.dart';

class EditProductUseCase {
  final EditProductRepo editProductRepo;

  EditProductUseCase({required this.editProductRepo});


  Future<Either<Failure, EditProductEntity>> call(EditProductEntity editProductEntity) async {
    return await editProductRepo.editProduct(editProductEntity);
  }

}
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/delete_product_entity.dart';
import '../repositories/delete_product_repo.dart';

class DeleteProductUseCase {
  final DeleteProductRepo deleteProductRepo;

  DeleteProductUseCase({required this.deleteProductRepo});

  Future<Either<Failure, DeleteProductEntity>> call(
      DeleteProductEntity deleteProductEntity) async {
    return await deleteProductRepo.product(deleteProductEntity);
  }
}

import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/delete_product_entity.dart';

abstract class DeleteProductRepo {
  Future<Either<Failure, DeleteProductEntity>> product(
      DeleteProductEntity deleteProductEntity);
}

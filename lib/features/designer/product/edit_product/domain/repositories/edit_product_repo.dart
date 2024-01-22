
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/edit_product_entity.dart';

abstract class EditProductRepo {
  Future<Either<Failure, EditProductEntity>> editProduct(EditProductEntity editProductEntity);
}
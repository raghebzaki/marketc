
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/add_product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, AddProductEntity>> addProduct(AddProductEntity addProductEntity);
}
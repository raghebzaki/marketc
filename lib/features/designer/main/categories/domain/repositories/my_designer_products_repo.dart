
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/my_designer_products_entity.dart';

abstract class MyDesignerProductsRepo {
  Future<Either<Failure, MyDesignerProductsEntity>> myProducts(MyDesignerProductsEntity myDesignerProductsEntity,int? nextPage);
}
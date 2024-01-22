import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/my_designer_products_entity.dart';
import '../../domain/repositories/my_designer_products_repo.dart';
import '../data_sources/my_designer_products_service.dart';

class MyDesignerProductsRepoImpl implements MyDesignerProductsRepo {
  final MyDesignerProductsService myDesignerProductsService;

  MyDesignerProductsRepoImpl({required this.myDesignerProductsService});

  @override
  Future<Either<Failure, MyDesignerProductsEntity>> myProducts(
      MyDesignerProductsEntity myDesignerProductsEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final orders = await myDesignerProductsService
            .getProducts(myDesignerProductsEntity);
        return right(orders);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}

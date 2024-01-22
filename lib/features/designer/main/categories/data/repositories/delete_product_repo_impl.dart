import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/delete_product_entity.dart';
import '../../domain/repositories/delete_product_repo.dart';
import '../data_sources/delete_product_service.dart';

class DeleteProductRepoImpl implements DeleteProductRepo {
  final DeleteProductService deleteProductService;

  DeleteProductRepoImpl({required this.deleteProductService});

  @override
  Future<Either<Failure, DeleteProductEntity>> product(
      DeleteProductEntity deleteProductEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final orders = await deleteProductService.delete(deleteProductEntity);
        return right(orders);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/edit_product_entity.dart';
import '../../domain/repositories/edit_product_repo.dart';
import '../data_sources/edit_product_service.dart';

class EditProductRepoImpl implements EditProductRepo {
  final EditProductService editProductService;

  EditProductRepoImpl({required this.editProductService});

  @override
  Future<Either<Failure, EditProductEntity>> editProduct(
      EditProductEntity editProductEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final product = await editProductService.edit(editProductEntity);
        return right(product);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}

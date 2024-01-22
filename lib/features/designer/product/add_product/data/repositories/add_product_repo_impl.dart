import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/add_product_entity.dart';
import '../../domain/repositories/add_product_repo.dart';
import '../data_sources/add_product_service.dart';


class AddProductRepoImpl implements AddProductRepo {
  final AddProductService addProductService;

  AddProductRepoImpl({required this.addProductService});

  @override
  Future<Either<Failure, AddProductEntity>> addProduct(
      AddProductEntity addProductEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final product = await addProductService.add(addProductEntity);
        return right(product);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}

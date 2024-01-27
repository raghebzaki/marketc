import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/size_entity.dart';
import '../../domain/repositories/size_repo.dart';
import '../data_sources/size_service.dart';

class SizesRepoImpl implements SizesRepo {
  final SizeService sizeService;

  SizesRepoImpl({required this.sizeService});

  @override
  Future<Either<Failure, List<ProductSizesEntity>>> getSizes() async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getSizes = await sizeService.getSizes();
        return right(getSizes);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}

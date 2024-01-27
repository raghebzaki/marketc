import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/color_entity.dart';
import '../../domain/repositories/color_repo.dart';
import '../data_sources/color_service.dart';

class ColorsRepoImpl implements ColorsRepo {
  final ColorService colorService;

  ColorsRepoImpl({required this.colorService});

  @override
  Future<Either<Failure, List<ProductColorsEntity>>> getColors() async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getColors = await colorService.getColors();
        return right(getColors);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}

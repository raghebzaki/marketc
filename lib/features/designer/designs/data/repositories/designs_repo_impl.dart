import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/designs_entity.dart';
import '../../domain/repositories/designs_repo.dart';
import '../data_sources/designs_service.dart';


class DesignsRepoImpl implements DesignsRepo {
  final DesignsService editProfileService;

  DesignsRepoImpl(this.editProfileService);


  @override
  Future<Either<Failure, List<DesignsEntity>>> getAllDesigns(int? nextPage) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getContracts = await editProfileService.getAllDesigns(nextPage);
        return right(getContracts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
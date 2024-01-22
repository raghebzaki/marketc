import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/designer_carousel_entity.dart';
import '../../domain/repositories/designer_carousel_repo.dart';
import '../data_sources/designer_carousel_service.dart';


class DesignerCarouselRepoImpl implements DesignerCarouselRepo {
  final DesignerCarouselService carouselService;

  DesignerCarouselRepoImpl(this.carouselService);


  @override
  Future<Either<Failure, List<DesignerCarouselEntity>>> getAllCarousel() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getCarousel = await carouselService.getAllCarousel();
        return right(getCarousel);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/designer_carousel_model.dart';

abstract class DesignerCarouselService {
  Future<List<DesignerCarouselModel>> getAllCarousel();
}

class DesignerCarouselServiceImpl implements DesignerCarouselService {

  @override
  Future<List<DesignerCarouselModel>> getAllCarousel() async {

    Dio dio = await DioFactory.getDio();
    List<DesignerCarouselModel> carouselList = [];

    final contracts = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.designerCarouselUri,
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data'];
      carouselList = List<DesignerCarouselModel>.from(
        l.map(
              (model) => DesignerCarouselModel.fromJson(model),
        ),
      );
    }

    return carouselList;
  }


}

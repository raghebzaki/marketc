import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/designer_carousel_model.dart';

abstract class DesignerCarouselService {
  Future<List<DesignerCarouselModel>> getAllCarousel(int nextPage);
}

class DesignerCarouselServiceImpl implements DesignerCarouselService {

  @override
  Future<List<DesignerCarouselModel>> getAllCarousel(int nextPage) async {

    Dio dio = await DioFactory.getDio();
    List<DesignerCarouselModel> carouselList = [];

    final ads = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.designerCarouselUri,
        queryParameters: {
          "page": nextPage,
        }
    );

    if (ads.statusCode == 200) {
      Iterable l = ads.data['data']['data'];
      carouselList = List<DesignerCarouselModel>.from(
        l.map(
              (model) => DesignerCarouselModel.fromJson(model),
        ),
      );
    }

    return carouselList;
  }


}

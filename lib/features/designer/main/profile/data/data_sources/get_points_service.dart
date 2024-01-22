import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/get_points_model.dart';

abstract class GetPointsService {
  Future<List<GetPointsModel>> getAllPoints(num? userId);
}

class GetPointsServiceImpl implements GetPointsService {

  @override
  Future<List<GetPointsModel>> getAllPoints(num? userId) async {

    Dio dio = await DioFactory.getDio();
    List<GetPointsModel> getPointsList = [];

    final contracts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designerGetPoints,
      data: {
        'user_id':userId
      }
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data'];
      getPointsList = List<GetPointsModel>.from(
        l.map(
              (model) => GetPointsModel.fromJson(model),
        ),
      );
    }

    return getPointsList;
  }


}

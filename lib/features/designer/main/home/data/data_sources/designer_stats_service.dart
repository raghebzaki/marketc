import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/designer_stats_entity.dart';
import '../models/designer_stats_model.dart';

abstract class DesignerStatService {
  Future<DesignerStatsModel> getStats(DesignerStatsEntity designerStatsEntity);
}

class DesignerStatServiceImpl implements DesignerStatService {
  @override
  Future<DesignerStatsModel> getStats(
      DesignerStatsEntity designerStatsEntity) async {
    Dio dio = await DioFactory.getDio();
    DesignerStatsModel statsModel = const DesignerStatsModel();

    final stats = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.getDesignerStatsUri,
      queryParameters: DesignerStatsModel.toJson(designerStatsEntity),
    );

    if (stats.statusCode == 200) {
      DesignerStatsModel.fromJson(stats.data["data"]);
    }

    return statsModel;
  }
}

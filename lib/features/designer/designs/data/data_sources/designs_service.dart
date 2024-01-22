import 'package:dio/dio.dart';
import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/designs_entity.dart';
import '../models/designs_model.dart';

abstract class DesignsService {
  Future<List<DesignsModel>> getAllDesigns(DesignsEntity designsEntity,int? nextPage);
}

class DesignsServiceImpl implements DesignsService {

  @override
  Future<List<DesignsModel>> getAllDesigns(DesignsEntity designsEntity,int? nextPage) async {
    Dio dio = await DioFactory.getDio();
    List<DesignsModel> designsList = [];

    final contracts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designsUri,
      data: {
        "page": nextPage,
      },
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data']['data'];
      designsList = List<DesignsModel>.from(
        l.map(
              (model) => DesignsModel.fromJson(model),
        ),
      );
    }

    return designsList;
  }
}
import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/user_balance_entity.dart';
import '../models/user_balance_model.dart';

abstract class UserBalanceService {
  Future<List<UserBalanceModel>> getBalance(
      UserBalanceEntity userBalanceEntity);

  Future<UserBalanceModel> withdrawBalance(UserBalanceEntity userBalanceEntity);
}

class UserBalanceServiceImpl implements UserBalanceService {
  @override
  Future<List<UserBalanceModel>> getBalance(
      UserBalanceEntity userBalanceEntity) async {
    Dio dio = await DioFactory.getDio();
    List<UserBalanceModel> balanceRequests = [];

    final getBalance = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.designerGetBalanceUri,
      queryParameters: UserBalanceModel.getBalanceToJson(userBalanceEntity),
    );

    if (getBalance.statusCode == 200) {
      Iterable l = getBalance.data['data'];
      balanceRequests = List<UserBalanceModel>.from(
        l.map(
          (model) => UserBalanceModel.fromJson(model),
        ),
      );
    }

    return balanceRequests;
  }

  @override
  Future<UserBalanceModel> withdrawBalance(
      UserBalanceEntity userBalanceEntity) async {
    Dio dio = await DioFactory.getDio();
    UserBalanceModel userBalanceModel = const UserBalanceModel();

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designerWithdrawRequestUri,
      data: UserBalanceModel.withdrawToJson(userBalanceEntity),
    );

    if (orders.statusCode == 200) {
      userBalanceModel = UserBalanceModel.fromJson(orders.data);
    }

    return userBalanceModel;
  }
}

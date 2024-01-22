import 'package:dio/dio.dart';
import 'package:marketc/features/customer/profile/contact_us/data/models/contact_us_model.dart';
import 'package:marketc/features/customer/profile/contact_us/domain/entities/contact_us_entity.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';

abstract class ContactUsService {
  Future<ContactUsModel> sendMessage(ContactUsEntity contactUsEntity);
}

class ContactUsServiceImpl implements ContactUsService {

  @override
  Future<ContactUsModel> sendMessage(ContactUsEntity contactUsEntity) async {

    Dio dio = await DioFactory.getDio();
    ContactUsModel contactUsModel = const ContactUsModel();

    final contracts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.contactUsUri,
      data: ContactUsModel.toJson(contactUsEntity),
    );

    if (contracts.statusCode == 200) {
      contactUsModel=ContactUsModel.fromJson(contracts.data);
    }

    return contactUsModel;
  }

}

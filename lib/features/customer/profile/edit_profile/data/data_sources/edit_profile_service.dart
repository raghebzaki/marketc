import 'package:dio/dio.dart';
import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/edit_profile_entity.dart';
import '../models/edit_profile_model.dart';

abstract class EditProfileService {
  Future<EditProfileModel> sendMessage(EditProfileEntity editProfileEntity);
}

class EditProfileServiceImpl implements EditProfileService {

  @override
  Future<EditProfileModel> sendMessage(EditProfileEntity editProfileEntity) async {

    Dio dio = await DioFactory.getDio();
    EditProfileModel editProfileModel = const EditProfileModel();

    final contracts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.editUserProfileUri,
      data: EditProfileModel.toJson(editProfileEntity),
    );

    if (contracts.statusCode == 200) {
      editProfileModel=EditProfileModel.fromJson(contracts.data);
    }

    return editProfileModel;
  }

}

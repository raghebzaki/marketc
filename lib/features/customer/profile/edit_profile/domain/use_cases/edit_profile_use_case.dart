import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/profile/edit_profile/domain/entities/edit_profile_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/edit_profile_repo.dart';


class EditProfileUseCase {
  final EditProfileRepo editProfileRepo;

  EditProfileUseCase(this.editProfileRepo);

  Future<Either<Failure,EditProfileEntity>> call(EditProfileEntity editProfileEntity) async {
    return await editProfileRepo.editProfile(editProfileEntity);
  }
}

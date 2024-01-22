import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/profile/contact_us/domain/entities/contact_us_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/contact_us_repo.dart';


class ContactUsUseCase {
  final ContactUsRepo contactUsRepo;

  ContactUsUseCase(this.contactUsRepo);

  Future<Either<Failure,ContactUsEntity>> call(ContactUsEntity contactUsEntity) async {
    return await contactUsRepo.sendMessage(contactUsEntity);
  }
}

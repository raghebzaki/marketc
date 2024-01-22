import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/designs_entity.dart';
import '../repositories/designs_repo.dart';


class DesignsUseCase {
  final DesignsRepo designsRepoRepo;

  DesignsUseCase(this.designsRepoRepo);

  Future<Either<Failure,List<DesignsEntity>>> call(int? nextPage) async {
    return await designsRepoRepo.getAllDesigns(nextPage);
  }
}

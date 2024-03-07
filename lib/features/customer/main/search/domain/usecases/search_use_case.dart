import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../entities/search_entity.dart';
import '../repositories/search_repo.dart';

class SearchUseCase {
  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});
  Future<Either<Failure, List<ProductEntity>>> call(
      SearchEntity searchEntity) async {
    return await searchRepo.searchProducts(searchEntity);
  }

}
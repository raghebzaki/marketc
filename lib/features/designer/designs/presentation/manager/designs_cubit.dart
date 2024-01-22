import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/designs/domain/entities/designs_entity.dart';
import 'package:marketc/features/designer/designs/domain/use_cases/designs_use_case.dart';

part 'designs_state.dart';
part 'designs_cubit.freezed.dart';

class DesignsCubit extends Cubit<DesignsState> {
  DesignsCubit({required this.designsUseCase}) : super(const DesignsState.initial());

  static DesignsCubit get(context) => BlocProvider.of(context);

  final DesignsUseCase designsUseCase;

  getAllDesigns(DesignsEntity designsEntity,int? nextPage) async {
    if (nextPage == 1) {
      emit(const DesignsState.loading());
    } else {
      emit(const DesignsState.paginationLoading());
    }

    final getAllDesign = await designsUseCase(designsEntity, nextPage);

    getAllDesign.fold(
          (l) => {
        if (nextPage == 1)
          {
            emit(
              DesignsState.error(
                l.code.toString(),
                l.message,
              ),
            ),
          }
        else
          {
            emit(
              DesignsState.paginationError(
                l.code.toString(),
                l.message,
              ),
            ),
          }
      },
          (r) => {
        emit(
          DesignsState.success(r),
        ),
      },
    );
  }
}

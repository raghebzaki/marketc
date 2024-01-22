import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/main/profile/domain/entities/balance_entity.dart';
import 'package:marketc/features/designer/main/profile/domain/use_cases/balance_use_case.dart';

part 'balance_state.dart';
part 'balance_cubit.freezed.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit({required this.balanceUseCase}) : super(const BalanceState.initial());

  final BalanceUseCase balanceUseCase;
  static BalanceCubit get(context) => BlocProvider.of(context);

  getBalance(BalanceEntity balanceEntity) async {

    emit(const BalanceState.loading());

    final send = await balanceUseCase(balanceEntity);

    send.fold(
          (l) => {
        emit(
          BalanceState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          BalanceState.success(r),
        ),
      },
    );
  }
}

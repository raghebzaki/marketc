import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_balance_entity.dart';
import '../../../domain/usecases/withdraw_user_balance_use_case.dart';

part 'withdraw_balance_state.dart';
part 'withdraw_balance_cubit.freezed.dart';

class WithdrawBalanceCubit extends Cubit<WithdrawBalanceStates> {
  WithdrawBalanceCubit({required this.withdrawUserBalanceUseCase}) : super(const WithdrawBalanceStates.initial());

  static WithdrawBalanceCubit get(BuildContext context) => BlocProvider.of(context);

  final WithdrawUserBalanceUseCase withdrawUserBalanceUseCase;

  withdrawUserBalance(UserBalanceEntity userBalanceEntity) async {
    emit(const WithdrawBalanceStates.withdrawalLoading());

    final balance = await withdrawUserBalanceUseCase(userBalanceEntity);

    balance.fold(
          (l) => {
        emit(
          WithdrawBalanceStates.withdrawalError(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          WithdrawBalanceStates.withdrawalSuccess(r),
        ),
      },
    );
  }

}

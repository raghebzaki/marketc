import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/profile/user_balance/domain/usecases/get_user_balance_use_case.dart';

import '../../../domain/entities/user_balance_entity.dart';

part 'get_balance_state.dart';

part 'get_balance_cubit.freezed.dart';

class GetBalanceCubit extends Cubit<GetBalanceStates> {
  GetBalanceCubit({required this.getUserBalanceUseCase})
      : super(const GetBalanceStates.initial());

  static GetBalanceCubit get(BuildContext context) => BlocProvider.of(context);

  final GetUserBalanceUseCase getUserBalanceUseCase;

  getUserBalance(UserBalanceEntity userBalanceEntity) async {
    emit(const GetBalanceStates.getBalanceLoading());

    final balance = await getUserBalanceUseCase(userBalanceEntity);

    balance.fold(
      (l) => {
        emit(
          GetBalanceStates.getBalanceError(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          GetBalanceStates.getBalanceSuccess(r),
        ),
      },
    );
  }
}

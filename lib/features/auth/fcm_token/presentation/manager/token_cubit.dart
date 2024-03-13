import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/token_entity.dart';
import '../../domain/use_cases/token_use_case.dart';

part 'token_state.dart';

part 'token_cubit.freezed.dart';

class TokenCubit extends Cubit<TokenStates> {
  TokenCubit({required this.tokenUseCase}) : super(const TokenStates.initial());

  static TokenCubit get(BuildContext context) => BlocProvider.of(context);

  final TokenUseCase tokenUseCase;

  updateFcmToken(TokenEntity tokenEntity) async {
    emit(const TokenStates.loading());
    final token = await tokenUseCase(tokenEntity);

    token.fold(
      (l) => {
        emit(
          TokenStates.error(l.code.toString(), l.message),
        ),
      },
      (r) => {
        emit(
          TokenStates.success(r),
        ),
      },
    );
  }
}

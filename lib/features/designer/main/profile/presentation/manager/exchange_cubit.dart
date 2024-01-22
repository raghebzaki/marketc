import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/main/profile/domain/entities/exchange_entity.dart';

import '../../domain/use_cases/exchange_use_case.dart';

part 'exchange_state.dart';
part 'exchange_cubit.freezed.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  ExchangeCubit({required this.exchangeUseCase}) : super(const ExchangeState.initial());
  final ExchangeUseCase exchangeUseCase;
  static ExchangeCubit get(context) => BlocProvider.of(context);

  getExchange(ExchangeEntity exchangeEntity) async {

    emit(const ExchangeState.loading());

    final send = await exchangeUseCase(exchangeEntity);

    send.fold(
          (l) => {
        emit(
          ExchangeState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          ExchangeState.success(r),
        ),
      },
    );
  }
}

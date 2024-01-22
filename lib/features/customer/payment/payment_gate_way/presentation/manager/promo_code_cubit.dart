import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/payment/payment_gate_way/domain/entities/promo_code_entity.dart';

import '../../domain/use_cases/promo_code_use_case.dart';

part 'promo_code_state.dart';
part 'promo_code_cubit.freezed.dart';

class PromoCodeCubit extends Cubit<PromoCodeState> {
  PromoCodeCubit({required this.promoCodeUseCase}) : super(const PromoCodeState.initial());
  static PromoCodeCubit get(context) => BlocProvider.of(context);

  final PromoCodeUseCase promoCodeUseCase;

  sendMessage(PromoCodeEntity promoCodeEntity) async {

    emit(const PromoCodeState.loading());

    final send = await promoCodeUseCase(promoCodeEntity);

    send.fold(
          (l) => {
        emit(
          PromoCodeState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          PromoCodeState.success(r),
        ),
      },
    );
  }
}

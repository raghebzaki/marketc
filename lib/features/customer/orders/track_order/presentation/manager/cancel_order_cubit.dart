import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/customer/orders/track_order/domain/entities/cancel_order_entity.dart';
import 'package:marketc/features/customer/orders/track_order/domain/use_cases/cancel_order_usecase.dart';

part 'cancel_order_state.dart';

part 'cancel_order_cubit.freezed.dart';

class CancelOrderCubit extends Cubit<CancelOrderStates> {
  CancelOrderCubit({required this.cancelOrderUseCase})
      : super(const CancelOrderStates.initial());

  static CancelOrderCubit get(BuildContext context) => BlocProvider.of(context);

  final CancelOrderUseCase cancelOrderUseCase;

  userLogin(CancelOrderEntity cancelOrderEntity) async {
    emit(const CancelOrderStates.loading());
    final order = await cancelOrderUseCase(cancelOrderEntity);

    order.fold(
      (l) {
        emit(
          CancelOrderStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          CancelOrderStates.success(r),
        );
      },
    );
  }
}

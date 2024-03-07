import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/entity/buy_subscription_entity.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/usecases/buy_subscription_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

part 'buy_supscription_state.dart';

part 'buy_supscription_cubit.freezed.dart';

class BuySubscriptionCubit extends Cubit<BuySubscriptionStates> {
  BuySubscriptionCubit({required this.buySubscriptionUseCase})
      : super(const BuySubscriptionStates.initial());

  static BuySubscriptionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final BuySubscriptionUseCase buySubscriptionUseCase;

  buySubscriptions(BuySubscriptionEntity buySubscriptionEntity) async {
    emit(BuySubscriptionStates.loading());

    final buySubs = await buySubscriptionUseCase(buySubscriptionEntity);

    buySubs.fold(
      (l) => {
        emit(
          BuySubscriptionStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          BuySubscriptionStates.success(r),
        ),
      },
    );
  }

  paymentLauncher(String url) async {
    await launchUrl(
      Uri.parse(url),
    );
  }
}

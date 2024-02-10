import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/usecases/subscriptions_usecase.dart';

import '../../domain/entity/subscription_entity.dart';

part 'subscriptions_state.dart';
part 'subscriptions_cubit.freezed.dart';

class SubscriptionsCubit extends Cubit<SubscriptionsStates> {
  SubscriptionsCubit({required this.subscriptionsUseCase}) : super(const SubscriptionsStates.initial());

  static SubscriptionsCubit get(BuildContext context) => BlocProvider.of(context);

  final SubscriptionsUseCase subscriptionsUseCase;

  getPackages(SubscriptionsEntity subscriptionsEntity) async {
    subscriptionsEntity.nextPage == 1
        ? emit(const SubscriptionsStates.loading())
        : emit(const SubscriptionsStates.paginationLoading());

    final subs = await subscriptionsUseCase(subscriptionsEntity);

    subs.fold(
          (l) => {
            subscriptionsEntity.nextPage == 1
            ? emit(
          SubscriptionsStates.error(
            l.code.toString(),
            l.message,
          ),
        )
            : emit(
          SubscriptionsStates.paginationError(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          SubscriptionsStates.success(r),
        ),
      },
    );
  }


}

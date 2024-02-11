import 'package:equatable/equatable.dart';

class DesignerStatsEntity extends Equatable {
  final num? userId;
  final num? profitRatio;
  final num? purchases;
  final num? numberOfBuyers;
  final num? wallet;

  const DesignerStatsEntity({
    this.userId,
    this.profitRatio,
    this.purchases,
    this.numberOfBuyers,
    this.wallet,
  });

  @override
  List<Object?> get props =>
      [userId, profitRatio, purchases, numberOfBuyers, wallet,];


}

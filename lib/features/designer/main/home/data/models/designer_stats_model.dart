import 'package:marketc/features/designer/main/home/domain/entities/designer_stats_entity.dart';

class DesignerStatsModel extends DesignerStatsEntity {
  const DesignerStatsModel({
    super.userId,
    super.profitRatio,
    super.purchases,
    super.numberOfBuyers,
    super.wallet,
  });

  factory DesignerStatsModel.fromJson(Map<String, dynamic> json) {
    return DesignerStatsModel(
      profitRatio: json['profit_ratio'] ?? 0,
      purchases: json['purchases'] ?? 0,
      numberOfBuyers: json['number_of_buyers'] ?? 0,
      wallet: json['wallet'] ?? 0
      ,
    );
  }

  static Map<String, dynamic> toJson(DesignerStatsEntity designerStatsEntity) {
    return {
      'user_id': designerStatsEntity.userId,
    };
  }


}

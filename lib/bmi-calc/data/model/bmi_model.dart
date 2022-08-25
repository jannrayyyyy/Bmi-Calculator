// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';
import 'package:hive/hive.dart';

part 'bmi_model.g.dart';

@HiveType(typeId: 0)
class BmiModel extends BmiEntity {
  const BmiModel({
    @HiveField(0) required super.bmi,
  });

  factory BmiModel.fromMap(Map<String, dynamic> map) {
    return BmiModel(bmi: map['bmi']);
  }

  factory BmiModel.fromEntity(BmiEntity bmi) {
    return BmiModel(
      bmi: bmi.bmi,
    );
  }

  Map<String, dynamic> toMap() => {
        'bmi': bmi,
      };
}

import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';

abstract class Repository {
  Future<List<BmiEntity>> getBmi();
  Future<void> addBmi(BmiEntity bmi);
  Future<void> deleteBmi(String bmi);
}

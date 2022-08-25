// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';
import 'package:bmi_calc/bmi-calc/domain/repository/repository.dart';

class AddBmi {
  final Repository repo;
  AddBmi({required this.repo});

  Future<void> call(BmiEntity bmi) async {
    await repo.addBmi(bmi);
  }
}

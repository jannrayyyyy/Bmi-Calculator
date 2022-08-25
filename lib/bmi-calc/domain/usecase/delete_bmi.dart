// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calc/bmi-calc/domain/repository/repository.dart';

class DeleteBmi {
  final Repository repo;
  DeleteBmi({required this.repo});
  Future<void> call(String bmi) async {
    await repo.deleteBmi(bmi);
  }
}

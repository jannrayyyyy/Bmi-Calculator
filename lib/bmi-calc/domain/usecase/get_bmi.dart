// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';

import '../repository/repository.dart';

class GetBmi {
  final Repository repo;
  GetBmi({required this.repo});
  Future<List<BmiEntity>> call() async {
    return repo.getBmi();
  }
}

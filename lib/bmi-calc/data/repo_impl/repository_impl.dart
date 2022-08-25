import 'package:bmi_calc/bmi-calc/data/datasource/local_datasource.dart';
import 'package:bmi_calc/bmi-calc/data/model/bmi_model.dart';
import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';
import 'package:bmi_calc/bmi-calc/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource local;

  RepositoryImpl(this.local);
  @override
  Future<void> addBmi(BmiEntity bmi) async {
    await local.addBmi(BmiModel.fromEntity(bmi));
  }

  @override
  Future<void> deleteBmi(String bmi) async {
    await local.deleteBmi(bmi);
  }

  @override
  Future<List<BmiEntity>> getBmi() {
    return local.getBmi();
  }
}

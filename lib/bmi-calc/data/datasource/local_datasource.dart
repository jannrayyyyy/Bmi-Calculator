import 'package:bmi_calc/bmi-calc/data/model/bmi_model.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSource {
  Future<List<BmiModel>> getBmi();
  Future<void> addBmi(BmiModel bmi);
  Future<void> deleteBmi(String bmi);
}

class LocalDataSourceImpl implements LocalDataSource {
  final box = Hive.box('BmiHistory');
  @override
  Future<void> addBmi(BmiModel bmi) async {
    await box.put(bmi.bmi, bmi);
  }

  @override
  Future<void> deleteBmi(String bmi) async {
    await box.delete(bmi);
  }

  @override
  Future<List<BmiModel>> getBmi() async {
    var bmiBox = box.values.toList();
    final table = bmiBox.map((e) {
      return e as BmiModel;
    }).toList();
    return table;
  }
}

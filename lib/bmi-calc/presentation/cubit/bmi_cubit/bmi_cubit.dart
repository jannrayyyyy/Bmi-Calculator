// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';
import 'package:bmi_calc/bmi-calc/domain/usecase/add_bmi.dart';
import 'package:bmi_calc/bmi-calc/domain/usecase/delete_bmi.dart';
import 'package:bmi_calc/bmi-calc/domain/usecase/get_bmi.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  final GetBmi _get;
  final AddBmi _add;
  final DeleteBmi _delete;
  BmiCubit(
    this._get,
    this._add,
    this._delete,
  ) : super(BmiInitial());

  void getBmi() async {
    emit(Loading());

    final bmiData = await _get();

    if (bmiData.isEmpty) {
      emit(Empty());
    } else {
      emit(Loaded(bmi: bmiData));
    }
  }

  void addBmi(BmiEntity bmi) async {
    await _add(bmi);
  }

  void deleteBmi(String bmi) async {
    await _delete(bmi);
  }
}

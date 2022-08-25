import 'package:bmi_calc/bmi-calc/domain/entity/bmi_entity.dart';
import 'package:bmi_calc/bmi-calc/presentation/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:bmi_calc/bmi-calc/presentation/widgets/appbar_iconbutton.dart';
import 'package:bmi_calc/bmi-calc/presentation/widgets/custom_quicksand_text.dart';
import 'package:bmi_calc/bmi-calc/presentation/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/bmi_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final heights = TextEditingController();
  final weights = TextEditingController();
  String bmiOutput = '';

  void calculate() {
    double total = (int.parse(weights.text) /
        int.parse(heights.text) /
        int.parse(heights.text) *
        10000);
    bmiOutput = total.toStringAsFixed(2);
    final bmi = BmiEntity(bmi: bmiOutput);
    context.read<BmiCubit>().addBmi(bmi);
    context.read<BmiCubit>().getBmi();
    setState(() {
      heights.clear();
      weights.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [AppBarIconButton()],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CustomQuickSand(
                text: 'BMI \n CALCULATOR',
                textAlign: TextAlign.center,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 150),
              CustomTextFormField(controller: heights, hintText: 'Height'),
              const Divider(color: Colors.black, height: 20),
              CustomTextFormField(controller: weights, hintText: 'Weight'),
              const SizedBox(height: 70),
              InkWell(
                onTap: () {
                  if (heights.text.isNotEmpty &&
                      weights.text.isNotEmpty &&
                      heights.text.length <= 3 &&
                      weights.text.length <= 3) {
                    calculate();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        content: Text(
                          'Invalid Input',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 70),

              //display button
              bmiOutput.isEmpty
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorCondition(double.parse(bmiOutput))),
                        ),
                        CustomQuickSand(
                          text: bmiOutput,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ]),
    );
  }
}

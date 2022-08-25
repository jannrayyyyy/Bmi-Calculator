import 'package:bmi_calc/bmi-calc/presentation/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/utils/bmi_filter.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          if (state is Empty) {
            return const Center(child: Text('Empty'));
          } else if (state is Loaded) {
            return SingleChildScrollView(
              child: Column(
                  children: state.bmi.map((e) {
                return Slidable(
                  endActionPane:
                      ActionPane(motion: const DrawerMotion(), children: [
                    SlidableAction(
                      spacing: 1,
                      onPressed: (BuildContext context) {
                        context.read<BmiCubit>().deleteBmi(e.bmi);
                        context.read<BmiCubit>().getBmi();
                      },
                      foregroundColor: Colors.red,
                      icon: Icons.delete,
                    ),
                  ]),
                  child: Container(
                      width: double.infinity,
                      color: Colors.grey[200],
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        key: const ValueKey(2),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textCondition(double.parse(e.bmi)),
                          Text(e.bmi),
                        ],
                      )),
                );
              }).toList()),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

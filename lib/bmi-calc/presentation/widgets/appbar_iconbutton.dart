import 'package:bmi_calc/bmi-calc/presentation/widgets/bmi_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency_injection.dart';
import '../cubit/bmi_cubit/bmi_cubit.dart';
import '../screen/secondscreen.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const SimpleDialog(children: [BmiRangeContainer()]);
                });
          },
          icon: const Icon(Icons.info),
          color: Colors.blueGrey,
          iconSize: 35,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<BmiCubit>(
                  create: (context) => sl<BmiCubit>()..getBmi(),
                  child: const SecondScreen(),
                ),
              ),
            );
          },
          icon: const Icon(Icons.history),
          color: Colors.blueGrey,
          iconSize: 35,
        ),
      ],
    );
  }
}

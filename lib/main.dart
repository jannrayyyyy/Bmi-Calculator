import 'package:bmi_calc/bmi-calc/data/model/bmi_model.dart';
import 'package:bmi_calc/bmi-calc/presentation/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:bmi_calc/bmi-calc/presentation/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dependency_injection.dart' as di;
import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final path = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(BmiModelAdapter());
  await Hive.openBox('BmiHistory');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<BmiCubit>(
        create: (context) => sl<BmiCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}

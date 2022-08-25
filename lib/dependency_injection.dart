import 'package:bmi_calc/bmi-calc/data/datasource/local_datasource.dart';
import 'package:bmi_calc/bmi-calc/data/repo_impl/repository_impl.dart';
import 'package:bmi_calc/bmi-calc/domain/repository/repository.dart';
import 'package:bmi_calc/bmi-calc/domain/usecase/add_bmi.dart';
import 'package:bmi_calc/bmi-calc/domain/usecase/delete_bmi.dart';
import 'package:bmi_calc/bmi-calc/domain/usecase/get_bmi.dart';
import 'package:bmi_calc/bmi-calc/presentation/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => BmiCubit(sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetBmi(repo: sl()));
  sl.registerLazySingleton(() => AddBmi(repo: sl()));
  sl.registerLazySingleton(() => DeleteBmi(repo: sl()));
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}

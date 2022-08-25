// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bmi_cubit.dart';

abstract class BmiState extends Equatable {
  const BmiState();

  @override
  List<Object> get props => [];
}

class BmiInitial extends BmiState {}

class Loading extends BmiState {}

class Loaded extends BmiState {
  final List<BmiEntity> bmi;
  const Loaded({required this.bmi});
}

class Empty extends BmiState {}

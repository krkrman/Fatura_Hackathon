import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'second_task_state.dart';

class SecondTaskCubit extends Cubit<SecondTaskState> {
  SecondTaskCubit() : super(SecondTaskInitial());
  static SecondTaskCubit get(context) => BlocProvider.of(context);

  Color _randomColor = Colors.black;

  Color get randomColor => _randomColor;
  final _random = Random();

  void changeContainerColor() {
    _randomColor = Colors.primaries[_random.nextInt(Colors.primaries.length)];
    emit(SecondTaskColorChanged());
  }
}

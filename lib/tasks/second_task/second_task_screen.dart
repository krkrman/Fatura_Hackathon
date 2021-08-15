import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_fatura/buisness_logic/cubits/second_task_cubit/second_task_cubit.dart';

/*
 Second Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */
class SecondTaskScreen extends StatefulWidget {
  @override
  _SecondTaskScreenState createState() => _SecondTaskScreenState();
}

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber, child: child);
  }
}

class _SecondTaskScreenState extends State<SecondTaskScreen> {
  Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    var secondTaskCubit = SecondTaskCubit.get(context);
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => secondTaskCubit.changeContainerColor(),
        child: Icon(Icons.colorize),
      ),
      body: BackgroundWidget(child: Center(
        child: BlocBuilder<SecondTaskCubit, SecondTaskState>(
          builder: (context, state) {
            return Container(
              width: 100,
              height: 100,
              color: secondTaskCubit.randomColor,
            );
          },
        ),
      )),
    );
  }
}

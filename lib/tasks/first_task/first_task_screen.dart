import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_fatura/buisness_logic/cubits/first_task/first_taks_cubit.dart';

/*
 First Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */
class FirstTaskScreen extends StatelessWidget {
  Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building FirstTaskScreen");
    var firstTaskCubit = FirstTaskCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("First task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => firstTaskCubit.changeContainerColor(),
        child: Icon(Icons.colorize),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: BackgroundWidget()),
          Center(
            child: BlocBuilder<FirstTaskCubit, FirstTaskState>(
              builder: (context, state) {
                return Container(
                  width: 100,
                  height: 100,
                  color: firstTaskCubit.randomColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber);
  }
}

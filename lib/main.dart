import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_fatura/buisness_logic/cubits/second_task_cubit/second_task_cubit.dart';
import 'package:hackathon_fatura/task.dart';
import 'package:hackathon_fatura/tasks/first_task/first_task_screen.dart';
import 'package:hackathon_fatura/tasks/second_task/second_task_screen.dart';
import 'package:hackathon_fatura/tasks/third_task/business_logic/cubits/movie_cubit.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'buisness_logic/cubits/first_task/first_taks_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive..init(appDocumentDir.path);
  await Hive.openBox('HIVE_BOX');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirstTaskCubit>(
          create: (BuildContext context) => FirstTaskCubit(),
        ),
        BlocProvider<SecondTaskCubit>(
          create: (BuildContext context) => SecondTaskCubit(),
        ),
        BlocProvider<MovieCubit>(
          create: (BuildContext context) => MovieCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Fatura Hackathon',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final tasks = [
    Task(name: "First task", description: "Optimize build method", screen: FirstTaskScreen()),
    Task(
      name: "Second task",
      description: "Optimize build method",
      screen: SecondTaskScreen(),
    ),
    Task(name: "Third task", description: "Make movieApp", screen: ThirdTaskScreen())
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fatura Hackathon"),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Text(tasks[index].name),
          subtitle: Text(tasks[index].description),
          onTap: () {
            Navigator.of(context).push(tasks[index].screen);
          },
        ),
        itemCount: tasks.length,
      ),
    );
  }
}

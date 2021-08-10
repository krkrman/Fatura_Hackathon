import 'dart:math';

import 'package:flutter/material.dart';

/*
* Second Task : app consists of FAB and container
* when i pressed on FAB it's change  container Color
* but when i pressed on FAB it Rebuild Background widget
* which it's no need to rebuild
* you need to optimize build function as
* when i pressed on Button doesn't rebuild Background widget
*
* */
class SecondTaskScreen extends StatefulWidget {
  @override
  _SecondTaskScreenState createState() => _SecondTaskScreenState();
}

class BackgroundWidget extends StatelessWidget {
  final double height;

  BackgroundWidget({required this.height});

  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(height: height, color: Colors.amber);
  }
}

class _SecondTaskScreenState extends State<SecondTaskScreen> {
  Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _randomColor =
                Colors.primaries[_random.nextInt(Colors.primaries.length)];
          });
        },
        child: Icon(Icons.colorize),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: BackgroundWidget(
            height: MediaQuery.of(context).size.height,
          )),
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: _randomColor,
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  int ballNumber = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 100, end: 400).animate(controller)
      ..addListener(() {
        setState(() {
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/ball$ballNumber.png'),
          );
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlatButton(
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$ballNumber.png'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

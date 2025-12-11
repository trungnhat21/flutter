import 'dart:math';

import 'package:flutter/material.dart';

class Bai5Product extends StatefulWidget {
    Bai5Product({super.key});

  @override
  State<Bai5Product> createState() => _Bai5ProductState();
}

class _Bai5ProductState extends State<Bai5Product> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Change Color App'),
        backgroundColor: Colors.yellow,
      ),
      body: myBody() ,
    ),
    );
  }

  Color bgColor = Colors.purple;
  String colorName = 'Purple';
  List<Color> colors = [Colors.purple, Colors.red, Colors.green, Colors.blue];
  List<String> colorNames = ['Purple', 'Red', 'Green', 'Blue'];
  void _changeColor(){
    var rand = Random();
    var i = rand.nextInt(colors.length);
    setState(() {
      bgColor = colors[i];
      colorName = colorNames[i];
    });
  }
  Widget myBody() {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: _changeColor, child: Text('Change Color')),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Current Color: $colorName',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
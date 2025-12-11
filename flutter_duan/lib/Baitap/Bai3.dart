import 'package:flutter/material.dart';

class Bai3Product extends StatelessWidget {
  const Bai3Product({super.key});

  @override
  Widget build(BuildContext context) {
    return myBody();
  }
}

Widget myBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      block1(), 
      const SizedBox(height: 30),
      block2(), 
      const SizedBox(height: 30),
      block3(), 
      const SizedBox(height: 50,),
      block4(), 
      const SizedBox(height: 20,),
      block5(),
    ],
  );
}

Widget block1() {
  return const Padding(
    padding: EdgeInsets.only(right: 16.0, top: 16.0),
    child: Row (
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.notifications, size: 30, color: Colors.black),
        SizedBox(width: 30),
        Icon(Icons.extension, size: 30, color: Colors.black),
        SizedBox(width: 16), 
      ],
    ),
  );
}

Widget block2() {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Welcome,", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
        Text("Charlie", style: TextStyle(fontSize: 40),), 
      ],
    ),
  );
}

Widget block3() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          ),
        ),
      ],
    ),
  );
}

Widget block4() {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0), 
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Saved Places", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ],
    ),
  );
}

Widget block5() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network('images/anh1.jpg', fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network('images/anh2.jpg', fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network('images/anh3.jpg', fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network('images/anh4.jpg', fit: BoxFit.cover),
          ),
        ],
      ),
    ),
  );
}
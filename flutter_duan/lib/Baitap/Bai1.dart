import 'package:flutter/material.dart';

class Bai1Product extends StatelessWidget {
  const Bai1Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SingleChildScrollView( 
        child: myBody(),
      ),
    );
  }

  Widget myBody() {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 200, right: 200),
      child: Column(
        children: [
          block1(),
          block2(),
          block3(),
          block4(),
        ],
      ),
    );
  }
  Widget block1() {
    var src = "https://images.pexels.com/photos/2172499/pexels-photo-2172499.jpeg";
    return Padding( 
      padding: EdgeInsets.zero, 
      child: Image.network(
        src, 
        height: 200, 
        width: double.infinity, 
        fit: BoxFit.cover,
      ),
    );
  }
  Widget block2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Oeschinen Lake Campground", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8,),
                  Text("Kandersteg, Switzerland", style: TextStyle(fontSize: 16, color:Colors.blueGrey),),
                ],
              ),
            ),
            
            Row(
              children: const [
                Icon(Icons.star, color: Colors.redAccent, size: 25,),
                SizedBox(width: 4),
                Text("41", style: TextStyle(fontSize: 18),)
              ]
            )
          ],
        ),
    );
  }
  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(Icons.call, "CALL"),
          _buildActionButton(Icons.near_me, "ROUTE"),
          _buildActionButton(Icons.share, "SHARE"),
        ],
      ),
    );
  } 

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.blueAccent, size: 30,),
        const SizedBox(height: 8,),
        Text(label, style: const TextStyle(color: Colors.blueAccent, fontSize: 14),)
      ],
    );
  }

  Widget block4() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
      child: const Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.", 
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
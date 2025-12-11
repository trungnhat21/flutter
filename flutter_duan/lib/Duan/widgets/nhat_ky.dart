import 'package:flutter/material.dart';
import 'chi_tiet_nhat_ky.dart';

class NhatKy extends StatelessWidget {
  const NhatKy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 230, top: 50, bottom: 50),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChiTietNhatKy()),
          );
        },
        child: Column(
          children: [
            Text("Viết nhật ký", style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white, decoration: TextDecoration.none,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ]
            )),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(Icons.book_online, size: 50, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
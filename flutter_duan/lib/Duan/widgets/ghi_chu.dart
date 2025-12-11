import 'package:flutter/material.dart';
import 'chi_tiet_ghi_chu.dart';

class GhiChu extends StatelessWidget {
  const GhiChu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 230, top: 50, bottom: 50),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChiTietGhiChu()),
          );
        },
        child: Column(
          children: [
            Text("Thêm ghi chú", style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white, decoration: TextDecoration.none,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ]
            )),
            SizedBox(height: 10,),
            Icon(Icons.note_add, size: 50, color: Colors.red,),
          ],
        ),
      ),
    );
  }
}

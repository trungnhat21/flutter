import 'package:flutter/material.dart';
import 'chi_tiet_viec.dart';

class LichCaNhan extends StatelessWidget {
  const LichCaNhan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 190, top: 50, bottom: 50),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChiTietViec()),
          );
        },
        child: Column(
          children: [
            Text("Việc cần làm", style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white, decoration: TextDecoration.none,
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
              child: Icon(Icons.checklist_rtl, size: 50, color: Colors.red,),
            ),
          ],
        ),
      ),
    );
  }
}


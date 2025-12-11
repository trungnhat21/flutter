import 'package:flutter/material.dart';
import 'widgets/thoi_gian_lam_viec.dart';
import 'widgets/nhat_ky.dart';
import 'widgets/viec_can_lam.dart';
import 'widgets/ghi_chu.dart';
void main() {
  runApp(const QuanLyCaNhan());
}

class QuanLyCaNhan extends StatelessWidget {
  const QuanLyCaNhan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("QUẢN LÝ CÁ NHÂN", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.blue,
        ),
        body: Padding(padding:  EdgeInsets.only(left: 350, right: 350, top: 20),
          child: myBody(),
        ),
      ),
    );
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
          image: AssetImage('images/anh5.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
         child: Padding(
           padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
           child: Row(
            children: [
              Text('Thời gian làm việc', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(width: 200,),
              ThoiGianLamViec(),
            ],
           ),
         ),
       ),
        SizedBox(height: 20,),

       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
          image: AssetImage('images/anh6.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
         child: Padding(
           padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
           child: Row(
            children: [
              Text('Ghi chú cá nhân', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
              GhiChu(),
            ],
           ),
         ),
       ),
        SizedBox(height: 20,),

       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
          image: AssetImage('images/anh7.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
         child: Padding(
           padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
           child: Row(
            children: [
              Text('Nhật ký của bạn', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
              NhatKy(),
            ],
           ),
         ),
       ), 

        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
          image: AssetImage('images/anh8.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Row(
              children: [
                Text('Công việc cần làm', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
                LichCaNhan(),
              ],
            ),
          ),
        ),

        SizedBox(height: 20,),
      ],
    );
  }
}

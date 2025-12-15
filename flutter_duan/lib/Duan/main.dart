// import 'package:flutter/material.dart';
// import 'widgets/thoi_gian_lam_viec.dart';
// import 'widgets/nhat_ky.dart';
// import 'widgets/viec_can_lam.dart';
// import 'widgets/ghi_chu.dart';
// void main() {
//   runApp(const QuanLyCaNhan());
// }

// class QuanLyCaNhan extends StatelessWidget {
//   const QuanLyCaNhan({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text("QUẢN LÝ CÁ NHÂN", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
//           backgroundColor: Colors.blue,
//         ),
//         body: Padding(padding:  EdgeInsets.only(left: 350, right: 350, top: 20),
//           child: myBody(),
//         ),
//       ),
//     );
//   }

//   Widget myBody() {
//     return ListView(
//       scrollDirection: Axis.vertical,
//       children: [
//        Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           image: DecorationImage(
//           image: AssetImage('images/anh5.jpg'),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
//           ),
//         ),
//          child: Padding(
//            padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
//            child: Row(
//             children: [
//               Text('Thời gian làm việc', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
//               SizedBox(width: 200,),
//               ThoiGianLamViec(),
//             ],
//            ),
//          ),
//        ),
//         SizedBox(height: 20,),

//        Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           image: DecorationImage(
//           image: AssetImage('images/anh6.jpg'),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
//           ),
//         ),
//          child: Padding(
//            padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
//            child: Row(
//             children: [
//               Text('Ghi chú cá nhân', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
//               GhiChu(),
//             ],
//            ),
//          ),
//        ),
//         SizedBox(height: 20,),

//        Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           image: DecorationImage(
//           image: AssetImage('images/anh7.jpg'),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
//           ),
//         ),
//          child: Padding(
//            padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
//            child: Row(
//             children: [
//               Text('Nhật ký của bạn', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
//               NhatKy(),
//             ],
//            ),
//          ),
//        ), 

//         SizedBox(height: 20,),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//           image: AssetImage('images/anh8.jpg'),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
//           ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
//             child: Row(
//               children: [
//                 Text('Công việc cần làm', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
//                 LichCaNhan(),
//               ],
//             ),
//           ),
//         ),

//         SizedBox(height: 20,),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'firebase_options.dart'; 
import 'auth_gate.dart'; 
import 'widgets/thoi_gian_lam_viec.dart';
import 'widgets/nhat_ky.dart';
import 'widgets/viec_can_lam.dart'; 
import 'widgets/ghi_chu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản Lý Cá Nhân',
      home: AuthGate(), 
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          "QUẢN LÝ CÁ NHÂN", 
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)
        )),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => _signOut(),
            tooltip: 'Đăng xuất',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 350, vertical: 20),
        child: myBody(),
      ),
    );
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        _buildModuleContainer(
          title: 'Thời gian làm việc',
          imagePath: 'images/anh5.jpg',
          widget: ThoiGianLamViec(),
          spacer: SizedBox(width: 200), 
        ),
         SizedBox(height: 20,),
        _buildModuleContainer(
          title: 'Ghi chú cá nhân',
          imagePath: 'images/anh6.jpg',
          widget: GhiChu(),
        ),
         SizedBox(height: 20,),
        _buildModuleContainer(
          title: 'Nhật ký của bạn',
          imagePath: 'images/anh7.jpg',
          widget: NhatKy(),
        ), 
         SizedBox(height: 20,),

        _buildModuleContainer(
          title: 'Công việc cần làm',
          imagePath: 'images/anh8.jpg',
          widget: LichCaNhan(), 
        ),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget _buildModuleContainer({
    required String title,
    required String imagePath,
    required Widget widget,
    Widget? spacer,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
            if (spacer != null) spacer,
            widget,
          ],
        ),
      ),
    );
  }
}
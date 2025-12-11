import 'package:flutter/material.dart';

class Bai2Product extends StatelessWidget {
  const Bai2Product({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: myBody(),
      ),
    ) ;
  }
}
Widget myBody() {
    return Padding(
      padding: EdgeInsets.only(left: 250, right: 250),
      child: ListView(
        scrollDirection: Axis.vertical ,
        children: [
        block1(),
        block2(),
        block3(),
        block4(),
        block5(),
        block6()
      ],
      ),
    );
}

Widget block1() {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: NetworkImage("https://png.pngtree.com/background/20220714/original/pngtree-mobile-application-development-background-picture-image_1614015.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 95, 94, 94).withValues(alpha: 0.5),
          BlendMode.darken),
      ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("XML và Ứng dụng - Nhóm 1", style: TextStyle(fontSize: 30, color: Colors.white),),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onSelected: (value) {
                  print("Bạn chọn: $value");
                },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Xem chi tiết',
                  child: Text('Xem chi tiết'),
                ),
                PopupMenuItem(
                  value: 'di chuyển',
                  child: Text('di chuyển'),
                ),
                PopupMenuItem(
                  value: 'Hủy đăng ký',
                  child: Text('Hủy đăng ký'),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text("2025-2026.1.TIN4583.001", style: TextStyle(fontSize: 20, color: Colors.white),),
          ],
        ),
        Row(
          children: [
            Text("58 học viên", style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(height: 60,),
          ],
        ),
      ],
        ),

    );
}

Widget block2() {
  return Container(
    margin: EdgeInsets.only(top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: NetworkImage("https://media.istockphoto.com/id/1410950079/vi/anh/l%E1%BB%9Bp-h%E1%BB%8Dc-phong-c%C3%A1ch-hi%E1%BB%87n-%C4%91%E1%BA%A1i-trong-bu%E1%BB%95i-s%C3%A1ng-3d-render.jpg?s=2048x2048&w=is&k=20&c=Xmm-pWyrZDyVGXqWg1c7FLUA7nmQclZSuBuu7hTMYZM="),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 95, 94, 94).withValues(alpha: 0.5),
          BlendMode.darken),
      ),
      ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lập trình ứng dụng cho các t...", style: TextStyle(fontSize: 30, color: Colors.white),),
            PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onSelected: (value) {
                  print("Bạn chọn: $value");
                },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Xem chi tiết',
                  child: Text('Xem chi tiết'),
                ),
                PopupMenuItem(
                  value: 'di chuyển',
                  child: Text('di chuyển'),
                ),
                PopupMenuItem(
                  value: 'Hủy đăng ký',
                  child: Text('Hủy đăng ký'),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text("2025-2026.1.TIN4403.006", style: TextStyle(fontSize: 20, color: Colors.white),),
          ],
        ),
        Row(
          children: [
            Text("54 học viên", style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(height: 60,),
          ],
        ),
      ],
    ),
  );
}

Widget block3() {
  return Container(
    margin: EdgeInsets.only(top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: NetworkImage("https://cdn.pixabay.com/photo/2015/04/26/23/09/school-741165_1280.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 95, 94, 94).withValues(alpha: 0.5),
          BlendMode.darken),
      ),
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lập trình ứng dụng cho các t...", style: TextStyle(fontSize: 30, color: Colors.white),),
            PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onSelected: (value) {
                  print("Bạn chọn: $value");
                },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Xem chi tiết',
                  child: Text('Xem chi tiết'),
                ),
                PopupMenuItem(
                  value: 'di chuyển',
                  child: Text('di chuyển'),
                ),
                PopupMenuItem(
                  value: 'Hủy đăng ký',
                  child: Text('Hủy đăng ký'),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text("2025-2026.1.TIN4403.005", style: TextStyle(fontSize: 20, color: Colors.white,),),
          ],
        ),
        Row(
          children: [
            Text("52 học viên", style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(height: 60,),
          ],
        ),
      ],
    ),
  );
}
Widget block4() {
  return Container(
    margin: EdgeInsets.only(top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: NetworkImage("https://img.lovepik.com/png/20231114/classroom-technology-technology-in-classroom-sticker-cartoon_585657_wh860.png"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 95, 94, 94).withValues(alpha: 0.5),
          BlendMode.darken),
      ),
      ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lập trình ứng dụng cho các t...", style: TextStyle(fontSize: 30, color: Colors.white),),
            PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onSelected: (value) {
                  print("Bạn chọn: $value");
                },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Xem chi tiết',
                  child: Text('Xem chi tiết'),
                ),
                PopupMenuItem(
                  value: 'di chuyển',
                  child: Text('di chuyển'),
                ),
                PopupMenuItem(
                  value: 'Hủy đăng ký',
                  child: Text('Hủy đăng ký'),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text("2025-2026.1.TIN4403.004", style: TextStyle(fontSize: 20, color: Colors.white),),
          ],
        ),
        Row(
          children: [
            Text("50 học viên", style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(height: 60,),
          ],
        ),
      ],
    ),
  );
}

Widget block5() {
  return Container(
    margin: EdgeInsets.only(top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: NetworkImage("https://png.pngtree.com/background/20210710/original/pngtree-english-training-card-enrollment-cartoon-childlike-blue-banner-picture-image_1059394.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 95, 94, 94).withValues(alpha: 0.5),
          BlendMode.darken),
      ),
      ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lập trình ứng dụng cho các t...", style: TextStyle(fontSize: 30, color: Colors.white),),
           PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onSelected: (value) {
                  print("Bạn chọn: $value");
                },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Xem chi tiết',
                  child: Text('Xem chi tiết'),
                ),
                PopupMenuItem(
                  value: 'di chuyển',
                  child: Text('di chuyển'),
                ),
                PopupMenuItem(
                  value: 'Hủy đăng ký',
                  child: Text('Hủy đăng ký'),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text("2025-2026.1.TIN4403.007", style: TextStyle(fontSize: 20, color: Colors.white),),
          ],
        ),
        Row(
          children: [
            Text("80 học viên", style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(height: 60,),
          ],
        ),
      ],
    ),
  );
}

Widget block6() {
  return Container(
    margin: EdgeInsets.only(top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNE62FhtOL1D-1uSwYf3Ms8JejtCrFxadRAw&s"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 95, 94, 94).withValues(alpha: 0.5),
          BlendMode.darken),
      ),
      ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lập trình ứng dụng cho các t...", style: TextStyle(fontSize: 30, color: Colors.white),),
           PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onSelected: (value) {
                  print("Bạn chọn: $value");
                },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Xem chi tiết',
                  child: Text('Xem chi tiết'),
                ),
                PopupMenuItem(
                  value: 'di chuyển',
                  child: Text('di chuyển'),
                ),
                PopupMenuItem(
                  value: 'Hủy đăng ký',
                  child: Text('Hủy đăng ký'),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text("2025-2026.1.TIN4403.003", style: TextStyle(fontSize: 20, color: Colors.white),),
          ],
        ),
        Row(
          children: [
            Text("52 học viên", style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(height: 60,),
          ],
        ),
      ],
    ),
  );
}
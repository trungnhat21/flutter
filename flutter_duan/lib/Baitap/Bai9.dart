import 'package:flutter/material.dart';

class Bai9Product extends StatefulWidget {
  const Bai9Product({super.key});

  @override
  State<Bai9Product> createState() => _Bai9ProductState();
}

class _Bai9ProductState extends State<Bai9Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Đăng Nhập', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 17, 4, 103),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tên người dùng',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Vui lòng nhập tên người dùng", style: TextStyle(color: Colors.red),),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Mật khẩu',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {}, icon: Icon(Icons.visibility)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Vui lòng nhập mật khẩu", style: TextStyle(color: Colors.red), textAlign: TextAlign.left,),
            ),
            SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min, 
    children: [
      Icon(Icons.login, color: Colors.black), 
      SizedBox(width: 8), 
      Text(
        'Đăng Nhập',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  ),
)
          ],
        ),
      ),
    );
  }
}

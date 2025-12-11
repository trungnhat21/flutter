import 'package:flutter/material.dart';

class Bai8Product extends StatefulWidget {
  const Bai8Product({super.key});

  @override
  State<Bai8Product> createState() => _Bai8ProductState();
}

class _Bai8ProductState extends State<Bai8Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Đăng ký tài khoản', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 17, 4, 103),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Họ tên',
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
              child: Text("Vui lòng nhập họ tên", style: TextStyle(color: Colors.red),),
            ),
            SizedBox(height: 50),

            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
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
              child: Text("Vui lòng nhập email", style: TextStyle(color: Colors.red),),
            ),
            SizedBox(height: 50),

            TextField(
              decoration: InputDecoration(
                hintText: 'Mật khẩu',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {}, icon: Icon(Icons.visibility, color: Colors.red,)),
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
            SizedBox(height: 50),

            TextField(
              decoration: InputDecoration(
                hintText: 'Xác nhận mật khẩu',
                prefixIcon: Icon(Icons.lock,),
                suffixIcon: IconButton(
                  onPressed: () {}, icon: Icon(Icons.visibility, color: Colors.red,)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Vui lòng xác nhận mật khẩu", style: TextStyle(color: Colors.red), textAlign: TextAlign.left,),
            ),

            ElevatedButton(
              onPressed: () {
                // Xử lý đăng nhập
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 17, 4, 103),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Icon(Icons.login, color: Colors.white), 
                  SizedBox(width: 8), 
                  Text(
                    'Đăng Ký',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
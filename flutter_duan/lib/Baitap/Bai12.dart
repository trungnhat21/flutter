import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../Login/User.dart'; 
import '../Login/profile_screen.dart'; 

class Bai12Product extends StatefulWidget {
  const Bai12Product({super.key});

  @override
  State<Bai12Product> createState() => _Bai12ProductState();
}

class _Bai12ProductState extends State<Bai12Product> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  String? _errorMessage;
  
  @override
  void initState() {
    super.initState();
    _usernameController.text = 'kminchelle'; 
    _passwordController.text = '9uQFF1Lh'; 
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Vui lòng nhập đầy đủ tên người dùng và mật khẩu.";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      var data = json.encode({
        "username": username,
        "password": password,
        "expiresInMins": 30
      });
      var headers = {'Content-Type': 'application/json'};
      var dio = Dio();
      
      var response = await dio.request(
        'https://dummyjson.com/auth/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Đăng nhập thành công!');
        }
        
        final userData = response.data;
        if(userData != null && userData is Map<String, dynamic>) {
            final User user = User.fromJson(userData); 
            
            Navigator.of(context).pushReplacement( 
              MaterialPageRoute(
                builder: (context) => ProfileScreen(user: user), 
              ),
            );
            
            _usernameController.clear();
            _passwordController.clear();
        } else {
            setState(() {
                _errorMessage = "Phản hồi từ server không hợp lệ.";
            });
        }
        
      } else {
        String serverError = response.statusMessage ?? "Lỗi không xác định.";
        if (response.data != null && response.data is Map && response.data.containsKey('message')) {
           serverError = response.data['message'];
        }
        setState(() {
          _errorMessage = "Đăng nhập thất bại: $serverError";
        });
      }
    } on DioException catch (e) {
      String errorMsg = "Lỗi kết nối hoặc yêu cầu thất bại.";
      if (e.response != null && e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
        errorMsg = e.response!.data['message']; 
      }
      setState(() {
        _errorMessage = "Lỗi: $errorMsg";
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Đã xảy ra lỗi bất ngờ: ${e.toString()}"; 
      });
    } finally {
      setState(() {
        _isLoading = false; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng Nhập'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Tên người dùng',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Mật khẩu',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }, 
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              obscureText: _obscureText, 
            ),
            
            const SizedBox(height: 20),

            if (_errorMessage != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Row(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          Icon(Icons.login, color: Colors.white), 
                          SizedBox(width: 8), 
                          Text(
                            'Đăng Nhập',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
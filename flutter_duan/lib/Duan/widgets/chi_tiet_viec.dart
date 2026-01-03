import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChiTietViec extends StatefulWidget {
  const ChiTietViec({super.key});

  @override
  State<ChiTietViec> createState() => _ChiTietViecState();
}

class _ChiTietViecState extends State<ChiTietViec> {
  final TextEditingController _noiDungController = TextEditingController();
  List<Map<String, String>> _vieclamList = [];

  String _getSmartKey(String baseKey) {
    final user = FirebaseAuth.instance.currentUser;
    String identifier = user?.email ?? "khach"; 
    return "${identifier}_$baseKey";
  }

  @override
  void initState() {
  super.initState();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      _loadData();
    }
  });
}

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String smartKey = _getSmartKey('key_viec_lam');
    String? data = prefs.getString(smartKey);
    
    setState(() {
      if (data != null) {
        _vieclamList = List<Map<String, String>>.from(
          jsonDecode(data).map((item) => Map<String, String>.from(item)),
        );
      } else {
        _vieclamList = [];
      }
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    String smartKey = _getSmartKey('key_viec_lam');
    
    String encodedData = jsonEncode(_vieclamList);
    await prefs.setString(smartKey, encodedData);
  }

  void _themvieclam() {
    String noiDung = _noiDungController.text.trim();

    if (noiDung.isNotEmpty) {
      setState(() {
        _vieclamList.add({
          'noiDung': noiDung,
        });
        _noiDungController.clear();
      });
      _saveData();
    }
  }

  void _xoaViecLam(Map<String, String> vieclam) {
    setState(() {
      _vieclamList.remove(vieclam);
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Công việc cần làm")),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 214, 214),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 400, right: 250, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _noiDungController,
                      minLines: 10,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Việc cần làm',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 8, 15, 215)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'images/anh11.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.white,
                          child: Icon(Icons.image, size: 100, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 300),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _themvieclam,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Lưu việc cần làm'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Danh sách việc cần làm của bạn:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: _vieclamList.map((vieclam) {
                  return Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                        title: Text(
                          'Việc cần làm',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(vieclam['noiDung']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _xoaViecLam(vieclam),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
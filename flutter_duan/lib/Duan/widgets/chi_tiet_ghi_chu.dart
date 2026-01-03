import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class ChiTietGhiChu extends StatefulWidget {
  const ChiTietGhiChu({super.key});

  @override
  State<ChiTietGhiChu> createState() => _ChiTietGhiChuState();
}

class _ChiTietGhiChuState extends State<ChiTietGhiChu> {
  final TextEditingController _tieuDeController = TextEditingController();
  final TextEditingController _noiDungController = TextEditingController();

  List<Map<String, String>> _ghiChuList = [];

  @override
  void initState() {
    super.initState();
    _loadGhiChuTuMay();
  }

  Future<void> _loadGhiChuTuMay() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('key_ghi_chu');
    
    if (data != null && data.isNotEmpty) {
      setState(() {
        Iterable decoded = jsonDecode(data);
        _ghiChuList = decoded.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  Future<void> _saveGhiChuXuongMay() async {
    final prefs = await SharedPreferences.getInstance();
    String encodedData = jsonEncode(_ghiChuList); 
    await prefs.setString('key_ghi_chu', encodedData); 
  }

  void _luuGhiChu() {
    String tieuDe = _tieuDeController.text.trim();
    String noiDung = _noiDungController.text.trim();

    if (tieuDe.isNotEmpty && noiDung.isNotEmpty) {
      setState(() {
        _ghiChuList.add({
          'tieuDe': tieuDe,
          'noiDung': noiDung,
        });
        _tieuDeController.clear();
        _noiDungController.clear();
      });
      _saveGhiChuXuongMay(); 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ghi chú đã được lưu")),
      );
    }
  }

  void _xoaGhiChu(int index) {
    setState(() {
      _ghiChuList.removeAt(index);
    });
    _saveGhiChuXuongMay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Thêm ghi chú")),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 214, 214),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 400, right: 250, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          controller: _tieuDeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tiêu đề',
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _noiDungController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nội dung ghi chú',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('images/anh9.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _luuGhiChu,
                child: const Text('Lưu ghi chú'),
              ),
              SizedBox(height: 30),
              Text(
                'Danh sách ghi chú (Vĩnh viễn):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _ghiChuList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 220),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          _ghiChuList[index]['tieuDe']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(_ghiChuList[index]['noiDung']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _xoaGhiChu(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
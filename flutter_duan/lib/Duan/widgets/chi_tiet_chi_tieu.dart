import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

class ChiTietChiTieu extends StatefulWidget {
  final String tongTien;
  const ChiTietChiTieu({super.key, required this.tongTien});

  @override
  State<ChiTietChiTieu> createState() => _ChiTietChiTieuState();
}

class _ChiTietChiTieuState extends State<ChiTietChiTieu> {
  final TextEditingController _tenDoController = TextEditingController();
  final TextEditingController _giaTienController = TextEditingController();
  List<Map<String, String>> _spendingList = [];
  int _soDuHienTai = 0;

  void _hienThongBaoHetTien() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30),
              SizedBox(width: 10),
              Text("Cảnh báo chi tiêu"),
            ],
          ),
          content: const Text("Số tiền chi tiêu này đã vượt quá ngân sách ban đầu!"),
          actions: [
            TextButton(
              child: Text("ĐÃ HIỂU", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  String _getSmartKey(String baseKey) {
    final user = FirebaseAuth.instance.currentUser;
    return "${user?.email ?? 'khach'}_$baseKey";
  }

  @override
  void initState() {
    super.initState();
    _soDuHienTai = int.tryParse(widget.tongTien.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _loadData();
      }
    });
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String smartKey = _getSmartKey('key_chi_tieu');
    String? data = prefs.getString(smartKey);
    if (data != null) {
      setState(() {
        _spendingList = List<Map<String, String>>.from(
          jsonDecode(data).map((item) => Map<String, String>.from(item)),
        );
        _tinhToanLaiSoDu();
      });
    }
  }

  void _tinhToanLaiSoDu() {
    int tongDaChi = 0;
    for (var item in _spendingList) {
      tongDaChi += int.tryParse(item['gia']!) ?? 0;
    }
    setState(() {
      int nganSachGoc = int.tryParse(widget.tongTien.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      _soDuHienTai = nganSachGoc - tongDaChi;
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    String smartKey = _getSmartKey('key_chi_tieu');
    await prefs.setString(smartKey, jsonEncode(_spendingList));
  }

  void _themChiTieu() {
    String ten = _tenDoController.text.trim();
    String giaText = _giaTienController.text.trim();
    int? gia = int.tryParse(giaText);

    if (ten.isNotEmpty && gia != null) {
      if (gia > _soDuHienTai) {
        _hienThongBaoHetTien();
      }

      setState(() {
        _spendingList.add({'ten': ten, 'gia': giaText});
        _soDuHienTai -= gia;
        _tenDoController.clear();
        _giaTienController.clear();
      });
      _saveData();
    }
  }

  void _xoaChiTieu(int index) {
    int giaBiXoa = int.tryParse(_spendingList[index]['gia']!) ?? 0;
    setState(() {
      _spendingList.removeAt(index);
      _soDuHienTai += giaBiXoa;
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Chi tiêu ngắn hạn")),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 214, 214),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 300, right: 300, top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFF607D8B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text("SỐ DƯ CÒN LẠI", 
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(height: 8),
                    Text("$_soDuHienTai VNĐ", 
                      style: TextStyle(
                        color: _soDuHienTai < 0 ? Colors.redAccent : Colors.white, 
                        fontSize: 35, 
                        fontWeight: FontWeight.bold
                      )),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _tenDoController,
                      decoration: const InputDecoration(
                        labelText: 'Đã mua',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _giaTienController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Số tiền',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _themChiTieu,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 245, 240, 255),
                        foregroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Color.fromARGB(255, 230, 220, 255)),
                        ),
                      ),
                      child: Text("CHI TIÊU", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: _spendingList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var item = entry.value;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      title: Text(item['ten']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Text("Đã chi: ${item['gia']} VNĐ", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => _xoaChiTieu(index),
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
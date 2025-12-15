import 'package:flutter/material.dart';
import 'Bai1.dart';
import 'Bai2.dart';
import 'Bai3.dart';
import 'Bai4.dart';
import 'Bai5.dart';
import 'Bai6.dart';
import 'Bai7.dart';
import 'Bai8.dart';
import 'Bai9.dart';
import 'Bai10.dart';
import 'Bai11.dart';
import 'Bai12.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bài tập',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMenuItem = 1; 

  final Map<int, Widget> _contentWidgets = {
    1: const Bai1Product(),
    2: const Bai2Product(),
    3: const Bai3Product(),
    4: const Bai4Product(),
    5: Bai5Product(),
    6: const Bai6Product(),
    7: const Bai7Product(),
    8: const Bai8Product(),
    9: const Bai9Product(),
    10: const Bai10Product(),
    11: const Bai11Product(),
    12: const Bai12Product(),

  };

  Widget _buildMenuItem(String title, int index) {
    final isSelected = _selectedMenuItem == index;

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected, 
      selectedTileColor: Colors.blue.withOpacity(0.1),
      onTap: () {
        setState(() {
          _selectedMenuItem = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildMenuItem('Bài tập 1', 1),
                _buildMenuItem('Bài tập 2', 2),
                _buildMenuItem('Bài tập 3', 3),
                _buildMenuItem('Bài tập 4', 4),
                _buildMenuItem('Bài tập 5', 5),
                _buildMenuItem('Bài tập 6', 6),
                _buildMenuItem('Bài tập 7', 7),
                _buildMenuItem('Bài tập 8', 8),
                _buildMenuItem('Bài tập 9', 9),
                _buildMenuItem('Bài tập 10', 10),
                _buildMenuItem('Bài tập 11', 11),
                _buildMenuItem('Bài tập 12', 12),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Sản phẩm',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _contentWidgets[_selectedMenuItem] ?? const Center(child: Text("Không tìm thấy nội dung")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
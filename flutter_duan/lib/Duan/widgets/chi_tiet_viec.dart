import 'package:flutter/material.dart';
class ChiTietViec extends StatefulWidget {
  const ChiTietViec({super.key});

  @override
  State<ChiTietViec> createState() => _ChiTietViecState();
}

class _ChiTietViecState extends State<ChiTietViec> {
  final TextEditingController _noiDungController = TextEditingController();

  final List<Map<String, String>> _vieclamList = [];

  void _themvieclam() {
    String noiDung = _noiDungController.text.trim();

    if (noiDung.isNotEmpty) {
      setState(() {
        _vieclamList.add({
          'noiDung': noiDung,
        });
        _noiDungController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Công việc cần làm"), backgroundColor: Colors.grey
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 214, 214),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 400, right: 400, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 20),
              TextField(
                controller: _noiDungController,
                minLines: 10,
                maxLines: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Việc cần làm',
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 8, 15, 215))
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _themvieclam,
                  child: Text('Lưu việc cần làm'),
              ),
              ),
              SizedBox(height: 30),
              Text(
                'Danh sách việc cần làm:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: _vieclamList.map((vieclam) { // lặp qua đối tượng
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(
                        'Việc cần làm',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(vieclam['noiDung']!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _vieclamList.remove(vieclam);
                          });
                        },
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
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
      appBar: AppBar(title: Center(child: Text("Công việc cần làm")), backgroundColor: Colors.grey,
      automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 215, 214, 214),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Việc cần làm',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 8, 15, 215)),
                      ),
                    ),
                  ),
                  SizedBox(width: 50), 
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'images/anh11.jpg',
                        fit: BoxFit.cover,
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
                    child: Text('Lưu việc cần làm'),
                ),
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
                  return Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Card(
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
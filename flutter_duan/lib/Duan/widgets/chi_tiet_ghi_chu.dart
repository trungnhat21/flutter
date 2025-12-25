import 'package:flutter/material.dart';
class ChiTietGhiChu extends StatefulWidget {
  const ChiTietGhiChu({super.key});

  @override
  State<ChiTietGhiChu> createState() => _ChiTietGhiChuState();
}

class _ChiTietGhiChuState extends State<ChiTietGhiChu> {
  final TextEditingController _tieuDeController = TextEditingController();
  final TextEditingController _noiDungController = TextEditingController();

  final List<Map<String, String>> _ghiChuList = [];

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thêm ghi chú"), backgroundColor: Colors.grey,
      automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 215, 214, 214),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 400, right: 250, top: 10),
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tiêu đề',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 8, 15, 215)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _noiDungController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nội dung ghi chú',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 8, 15, 215)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 50),
                Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage('https://media.istockphoto.com/id/882917690/vi/vec-to/b%C3%BAt-ch%C3%AC-c%C3%B3-bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-gi%E1%BA%A5y.jpg?s=612x612&w=0&k=20&c=6BMvvuIiNrNCY3Pin_q_r0uLHXk14ny_p2KdHk0cl6Y='),
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
                    onPressed: _luuGhiChu,
                    child: Text('Lưu ghi chú'),
                ),
                ),
              ),
               SizedBox(height: 30),
               Text(
                'Danh sách ghi chú:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: _ghiChuList.map((ghiChu) { // lặp qua đối tượng
                  return Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        title: Text(
                          ghiChu['tieuDe']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(ghiChu['noiDung']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _ghiChuList.remove(ghiChu);
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
import 'package:flutter/material.dart';
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      locale: const Locale('en'), 
      supportedLocales: const [
        Locale('vi'),
        Locale('en'),
      ],
      home: const ChiTietNhatKy(),
    );
  }
}

class ChiTietNhatKy extends StatefulWidget {
  const ChiTietNhatKy({super.key});

  @override
  State<ChiTietNhatKy> createState() => _ChiTietNhatKyState();
}

class _ChiTietNhatKyState extends State<ChiTietNhatKy> {
  final TextEditingController _noiDungController = TextEditingController();
  
  late TextEditingController _ngayChonController;
  DateTime _ngayChon = DateTime.now(); 
  final List<Map<String, String>> _nhatkyList = [];
  String _formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return '$day/$month/$year';
  }

  String _formatDateTimeTitle(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute - ${_formatDate(dateTime)}';
  }
  @override
  void initState() {
    super.initState();
    _ngayChonController = TextEditingController(
      text: _formatDate(_ngayChon),
    );
  }

  @override
  void dispose() {
    _ngayChonController.dispose();
    _noiDungController.dispose();
    super.dispose();
  }
  
  Future<void> _chonNgay() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _ngayChon,
      firstDate: DateTime(2000), 
      lastDate: DateTime(2101), 
      locale: const Locale('en'), 
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blueGrey, 
              onPrimary: Colors.white, 
              onSurface: Colors.black, 
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _ngayChon) {
      setState(() {
        _ngayChon = picked;
        _ngayChonController.text = _formatDate(_ngayChon);
      });
    }
  }

  void _luuNhatKy() {
    final String noiDung = _noiDungController.text.trim();
    
    final DateTime thoiGianLuu = DateTime(
      _ngayChon.year,
      _ngayChon.month,
      _ngayChon.day,
      DateTime.now().hour,
      DateTime.now().minute,
      DateTime.now().second,
    );
    final String tieuDe = _formatDateTimeTitle(thoiGianLuu);

    if (noiDung.isNotEmpty) {
      setState(() {
        _nhatkyList.add({
          'tieuDe': tieuDe, 
          'noiDung': noiDung,
        });
        _noiDungController.clear();
        _ngayChon = DateTime.now();
        _ngayChonController.text = _formatDate(_ngayChon);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Viết nhật ký"), backgroundColor: Colors.grey,
      automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 215, 214, 214),
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
                        InkWell(
                          onTap: _chonNgay,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade200, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _ngayChonController.text,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Icon(Icons.calendar_today, color: Colors.blueGrey),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 20),
                        TextField(
                          controller: _noiDungController,
                          maxLines: 6, 
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nội dung nhật ký',
                            labelStyle: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50), 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://png.pngtree.com/element_our/20190528/ourmid/pngtree-journal-icon-image_1131447.jpg',
                      width: 250,
                      height: 230,
                      fit: BoxFit.cover,
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
                    onPressed: _luuNhatKy,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Thêm nhật ký', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
                SizedBox(height: 30),
                Text(
                'Danh sách nhật ký:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              SizedBox(height: 10),
              Column(
                children: _nhatkyList.map((nhatky) {
                  return Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Icon(Icons.note, color: Colors.blueGrey),
                        title: Text(
                          nhatky['tieuDe']!,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        subtitle: Text(
                          nhatky['noiDung']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _nhatkyList.remove(nhatky);
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

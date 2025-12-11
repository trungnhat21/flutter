import 'dart:async';
import 'package:flutter/material.dart';

class Bai7Product extends StatefulWidget {
  const Bai7Product({super.key});

  @override
  State<Bai7Product> createState() => _Bai7ProductState();
}

class _Bai7ProductState extends State<Bai7Product> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _seconds = 0;

  void _startCountdown() {
    if (_timer != null) _timer!.cancel();
    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) {
      return;
    }

    setState(() {
      _seconds = input;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resetCountdown() {
    _timer?.cancel();
    setState(() {
      _seconds = 0;
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⏳ Bộ đếm thời gian"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Nhập số giây cần đếm:",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400, // Gấp đôi kích thước
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "", // Xóa gợi ý "Ví dụ: 10"
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _formatTime(_seconds),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startCountdown,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text(
                      "Bắt đầu",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _resetCountdown,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text(
                      "Đặt lại",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

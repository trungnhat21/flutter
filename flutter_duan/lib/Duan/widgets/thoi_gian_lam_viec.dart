import 'package:flutter/material.dart';
import 'dart:async';

class ThoiGianLamViec extends StatefulWidget {
  const ThoiGianLamViec({super.key});

  @override
  State<ThoiGianLamViec> createState() => _ThoiGianLamViecState();
}

class _ThoiGianLamViecState extends State<ThoiGianLamViec> {
  static const int _defaultTime = 30 * 60;
  
  int _currentTime = _defaultTime;
  bool _isRunning = false;
  Timer? _timer;

  String get _displayTime {
    int minutes = _currentTime ~/ 60;
    int seconds = _currentTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    if (_currentTime == 0) {
      _resetTimer();
    }
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isRunning = false;
        });
        print("Hết giờ làm việc! Nghỉ 5 phút.");
      }
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _currentTime = _defaultTime;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _displayTime,
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 233, 227, 227)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: 'fabStartPause',
                onPressed: _isRunning ? _pauseTimer : _startTimer,
                backgroundColor: _isRunning ? Colors.orange : Colors.green,
                child: Icon(_isRunning ? Icons.pause : Icons.play_arrow, color: Colors.white),
              ),

              const SizedBox(width: 20),
              FloatingActionButton(
                heroTag: 'fabReset',
                onPressed: _resetTimer,
                backgroundColor: Colors.red,
                child: const Icon(Icons.refresh, color: Colors.white),
              ),
            ],
          ),
          
          const SizedBox(height: 10),
          const Text(
            "Phiên làm việc: 30 phút",
            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 185, 177, 177),
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}

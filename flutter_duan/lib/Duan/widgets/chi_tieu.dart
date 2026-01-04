import 'package:flutter/material.dart';
import 'chi_tiet_chi_tieu.dart';

class ChiTieuCard extends StatelessWidget {
  const ChiTieuCard({super.key});

  void _showInitialBalanceDialog(BuildContext context) {
    final TextEditingController _balanceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nhập tổng ngân sách (VNĐ)'),
        content: TextField(
          controller: _balanceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: ""),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              String amount = _balanceController.text.trim();
              if (amount.isNotEmpty) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChiTietChiTieu(tongTien: amount),
                  ),
                );
              }
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 230, top: 50, bottom: 50),
      child: GestureDetector(
        onTap: () => _showInitialBalanceDialog(context),
        child: Column(
          children: [
            Text(
              "Chi tiêu cá nhân",
              style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                decoration: TextDecoration.none,
                shadows: [
                  const Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.account_balance_wallet, size: 50, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
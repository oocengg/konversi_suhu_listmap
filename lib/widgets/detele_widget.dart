import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.clearHistory,
  });
  final Function() clearHistory;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 200,
      height: 20,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {
          clearHistory();
        },
        child: const Text(
          'Hapus Riwayat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

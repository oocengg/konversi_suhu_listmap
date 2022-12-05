import 'dart:ui';

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.historyItem,
  }) : super(key: key);

  final List<String> historyItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: historyItem.length,
          itemBuilder: (context, index) {
            return Text(
              historyItem[index],
              style: const TextStyle(
                fontSize: 16,
              ),
            );
          },
        ),
      ),
    );
  }
}

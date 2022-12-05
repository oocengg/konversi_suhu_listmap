import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.newValue,
    required this.dropdownOnChanged,
    required this.listItem,
    required this.konversi,
  }) : super(key: key);

  final String newValue;
  final Function dropdownOnChanged;
  final List<String> listItem;
  final Function() konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        items: listItem.map(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        value: newValue,
        onChanged: (value) {
          dropdownOnChanged(value);
          konversi();
        },
      ),
    );
  }
}

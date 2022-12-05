import 'package:flutter/material.dart';
import 'package:statefull_widget/widgets/button_widget.dart';
import 'package:statefull_widget/widgets/detele_widget.dart';
import 'package:statefull_widget/widgets/drop_down_widget.dart';
import 'package:statefull_widget/widgets/history_widget.dart';
import 'package:statefull_widget/widgets/information_suhu_widget.dart';
import 'package:statefull_widget/widgets/input_text_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController getSuhu = new TextEditingController();

  double result = 0;
  double inputUser = 0;

  String newValue = "Kelvin";
  double hasil = 0;

  void temperatureConversion() {
    setState(() {
      inputUser = double.parse(getSuhu.text);

      if (getSuhu.text.isNotEmpty) {
        switch (newValue) {
          case "Kelvin":
            result = inputUser + 273;
            break;
          case "Reamur":
            result = inputUser * (4 / 5);
            break;
          case "Fahrenheit":
            result = (inputUser * (9 / 5)) + 32;
            break;
          default:
        }
        historyItem.add(newValue + " : " + result.toString());
      }
    });
  }

  void dropdownOnChanged(String? changeValue) {
    setState(() {
      newValue = changeValue.toString();
    });
  }

  void clearHistory() {
    historyItem.clear();
    setState(() {});
  }

  List<String> listItem = ["Kelvin", "Reamur", "Fahrenheit"];

  List<String> historyItem = <String>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InputSuhu(
                    getSuhu: getSuhu,
                  ),
                  DropDown(
                    newValue: newValue,
                    dropdownOnChanged: dropdownOnChanged,
                    listItem: listItem,
                    konversi: temperatureConversion,
                  ),
                ],
              ),
              InformationSuhu(
                result: result,
              ),
              // ButtonWidget(
              //   konversi: temperatureConversion,
              // ),
              Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "Riwayat Konversi",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              DeleteButton(clearHistory: clearHistory),
              History(
                historyItem: historyItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

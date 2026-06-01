import 'package:calculator2/widget/calbtn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? firstNum;
  int? secondNum;
  String textToDisplay = '';
  String history = '';
  String? res;
  String? operation;

  void btnClicked(String btnval) {
    print(btnval);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Calculator')),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [Calbtn(text: 'AC', callback: btnClicked)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

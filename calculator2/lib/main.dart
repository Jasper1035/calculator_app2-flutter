import 'package:calculator2/widget/calbtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    if (btnval == 'AC') {
      firstNum = 0;
      secondNum = 0;
      res = '';
      textToDisplay = '';
      history = '';
    } else if (btnval == 'C') {
      firstNum = 0;
      secondNum = 0;
      res = '';
      textToDisplay = '';
    } else if (btnval == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnval == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnval == '÷' ||
        btnval == 'x' ||
        btnval == '+' ||
        btnval == '-') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnval;
    } else if (btnval == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum! + secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum! - secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum! * secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '÷') {
        res = (firstNum! / secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnval).toString();
    }

    setState(() {
      textToDisplay = res!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text(
            'Flutter Calculator',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment(1, 1),
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    fontSize: 25,
                    color: Color.fromARGB(255, 206, 228, 238),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1, 1),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  textToDisplay,
                  style: GoogleFonts.rubik(fontSize: 55, color: Colors.white),
                ),
              ),

              Divider(thickness: 2, color: Colors.white),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calbtn(
                      text: 'AC',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                    Calbtn(
                      text: 'C',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                    Calbtn(
                      text: '<',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                    Calbtn(
                      text: '÷',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calbtn(text: '7', callback: btnClicked),
                    Calbtn(text: '8', callback: btnClicked),
                    Calbtn(text: '9', callback: btnClicked),
                    Calbtn(
                      text: 'x',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calbtn(text: '4', callback: btnClicked),
                    Calbtn(text: '5', callback: btnClicked),
                    Calbtn(text: '6', callback: btnClicked),
                    Calbtn(
                      text: '+',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calbtn(text: '1', callback: btnClicked),
                    Calbtn(text: '2', callback: btnClicked),
                    Calbtn(text: '3', callback: btnClicked),
                    Calbtn(
                      text: '-',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calbtn(text: '+/-', callback: btnClicked),
                    Calbtn(text: '0', callback: btnClicked),
                    Calbtn(text: '.', callback: btnClicked),
                    Calbtn(
                      text: '=',
                      callback: btnClicked,
                      bgColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

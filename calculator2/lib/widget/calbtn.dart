import 'package:flutter/material.dart';

class Calbtn extends StatelessWidget {
  const Calbtn({
    super.key,
    required this.text,
    required this.callback,
    this.bgColor = Colors.black54,
  });

  final String text;
  final Color bgColor;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 70,
      width: 70,

      child: FloatingActionButton(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

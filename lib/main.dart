import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: spl(),
    );
  }
}

class spl extends StatefulWidget {
  const spl({Key? key}) : super(key: key);
  @override
  State<spl> createState() => _splState();
}

class _splState extends State<spl> {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: Colors.red
    ));
  }
}
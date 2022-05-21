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
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, color: Colors.amber),
            Container(height: 100, color: Colors.green),
            Container(height: 100, color: Colors.yellow),
            Container(height: 100, color: Colors.red),
            Container(height: 100, color: Colors.orange),
            Container(height: 100, color: Colors.blue),
            Container(height: 100, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tomato/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: Future.delayed(const Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('error occur while loading');
            return const Text('Error occur');
          } else if (snapshot.hasData) {
            return const TomatoApp();
          } else {  // 어떤 데이터도 도착하지 않았을 때
            return const SplashScreen();
          }
        });
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tomato/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        // physics: const AlwaysScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          IntroPage(_pageController),
          Container( color: Colors.blue,),
          Container( color: Colors.red,),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tomato/screens/start/address_page.dart';
import 'package:tomato/screens/start/auth_page.dart';
import 'package:tomato/screens/start/intro_page.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // physics: const NeverScrollableScrollPhysics(),
        // physics: const AlwaysScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          IntroPage(_pageController),
          AddressPage(),
          AuthPage(),
        ],
      ),
    );
  }
}

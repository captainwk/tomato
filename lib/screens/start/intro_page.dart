import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(child: Text("토마토 마켓")),
        ExtendedImage.asset('assets/images/carrot_intro.png')
        // ExtendedImage.asset('assets/images/golden.jpeg'),
      ],
    );
  }
}

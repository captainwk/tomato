import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:tomato/utils/logger.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '토마토 마켓',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).colorScheme.primary),//copyWith로 등록한 값을 제외하고 headline3를 따라서 스타일을 지정한다
            ),
            Stack (
              children: [
                ExtendedImage.asset('assets/images/carrot_intro.png'),
                Positioned(
                    left: 50,
                    right: 50,
                    top: 50,
                    bottom: 50,
                    child: ExtendedImage.asset('assets/images/carrot_intro_pos.png')),
              ],
            ),
            const Text(
              '우리 동네 중고 직거래 토마토마켓',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '토마토마켓은 동네 직거래 마켓이에요.\n내 동네를 설정하고 시작해보세요!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  logger.d('on text button clicked!!!');
                },
                child: Text(
                  '내 동네 설정하고 시작하기',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

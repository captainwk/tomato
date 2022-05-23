import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tomato/router/locations.dart';
import 'package:tomato/screens/start_screen.dart';
import 'package:tomato/screens/splash_screen.dart';
import 'package:tomato/utils/logger.dart';

final _routerDelegate = BeamerDelegate(
    // guard를 하고 싶은 path를 넣어준다.
    guards: [
      BeamGuard(
          pathBlueprints: ['/'],
          check: (context, location) {
            return false; // 로그인이 안되어 있으면 false , 되어 있으면 true
          },
          showPage: BeamPage(child: StartScreen()))
    ], locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));

void main() {
  logger.d('My first logger');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: Future.delayed(const Duration(milliseconds: 300), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object> snapshot) {
    if (snapshot.hasError) {
      debugPrint('error occur while loading');
      return const Text('Error occur');
    } else if (snapshot.hasData) {
      return const TomatoApp();
    } else {
      // 어떤 데이터도 도착하지 않았을 때
      return const SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'DoHyeon',
          hintColor: Colors.grey[350],
          textTheme: const TextTheme(
              headline3: TextStyle(fontFamily: 'DoHyeon'),  // headline3에만 내가 원하는 폰트를 지정할 수 있다.
              button: TextStyle(color: Colors.white)),
          appBarTheme: const AppBarTheme(
            elevation: 2,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontFamily: 'DoHyeon', fontSize: 24),
          ),
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate);
  }
}

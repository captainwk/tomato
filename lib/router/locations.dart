import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:tomato/screens/home_screen.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      // BuildContext context, RouteInformationSerializable state) {
      BuildContext context, BeamState state) {
    return [
      BeamPage(child: HomeScreen(), key: ValueKey('home')),
    ];
  }

  @override
  List get pathBlueprints => ['/'];
}

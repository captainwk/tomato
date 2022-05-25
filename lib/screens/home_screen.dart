import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato/states/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TextButton(
        onPressed: () {
          context.read<UserProvider>().setUserAuth(false);
        },
        child: Text("로그아웃"),
      ),
    );
  }
}

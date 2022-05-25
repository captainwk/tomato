import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato/states/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Container(

      ),
    );
  }
}

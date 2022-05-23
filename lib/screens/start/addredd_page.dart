import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: '도로명으로 검색',
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              // focusedBorder: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.blue)),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 24, minHeight: 24),
            ),
          ),
          SizedBox(
            // height: 30,
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                // minimumSize: Size(1, 40)
              ),
              label: Text(
                '현재위치로 찾기',
                style: Theme.of(context).textTheme.button,
              ),
              icon: Icon(
                CupertinoIcons.compass,
                size: 20,
                color: Theme.of(context).textTheme.button!.color,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("address $index"),
                  subtitle: Text("subtitle"),
                );
              },
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

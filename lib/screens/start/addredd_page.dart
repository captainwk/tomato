import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomato/constants/common_size.dart';
import 'package:tomato/screens/start/address_service.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: common_padding),
      child: Column(
        children: [
          TextFormField(
            controller: _addressController,
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
              onPressed: () {
                final text = _addressController.text;
                if(text.isNotEmpty) {
                  AddressService().searchAddressByStr(text);
                }
              },
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
              padding: const EdgeInsets.symmetric(vertical: common_padding),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("address $index"),
                  subtitle: const Text("subtitle"),
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

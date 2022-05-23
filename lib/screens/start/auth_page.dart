import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tomato/constants/common_size.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  final TextEditingController _phoneNumberController =
      TextEditingController(text: "010");
  final TextEditingController _codeController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '전화번호 로그인',
            style: Theme.of(context).appBarTheme.titleTextStyle,
            // style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(common_padding),
          child: Column(
            children: [
              Row(
                children: [
                  ExtendedImage.asset(
                    'assets/images/padlock.png',
                    width: size.width * 0.15,
                    height: size.width * 0.15,
                  ),
                  const SizedBox(width: common_sm_padding),
                  const Text(
                      '토마토마켓은 휴대폰 번호로 가입해요.\n번호는 안전하게 보관 되며\n어디에도 공개되지 않아요.'),
                ],
              ),
              const SizedBox(height: common_padding),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [MaskedInputFormatter('000 0000 0000')],
                decoration: InputDecoration(
                  focusedBorder: inputBorder,
                  border: inputBorder,
                ),
                validator: (phoneNumber) {
                  if (phoneNumber != null && phoneNumber.length == 13) {
                    return null;
                  } else {
                    //error
                    return '전화번호 똑바로 입력해';
                  }
                },
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if(_formkey.currentState != null) {
                      final bool passed = _formkey.currentState!.validate();
                      print(passed);
                    }
                  },
                  child: const Text('인증문자 발송'),
                ),
              ),
              const SizedBox(
                height: common_sm_padding,
              ),
              TextFormField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('000000')],
                decoration: InputDecoration(
                  focusedBorder: inputBorder,
                  border: inputBorder,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child:
                    TextButton(onPressed: () {}, child: const Text('인증문자 발송')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

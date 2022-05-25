import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tomato/constants/common_size.dart';
import 'package:tomato/constants/duration.dart';
import 'package:tomato/states/user_provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  final TextEditingController _phoneNumberController =
      TextEditingController(text: "010");

  final TextEditingController _codeController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IgnorePointer(
      // ignoring : true로 주게되면 해당 child 안에서 일어나는 모든 액션을 무시한다
      ignoring: _verificationStatus == VerificationStatus.verifying,
      child: Form(
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                TextButton(
                  onPressed: () {
                    if (_formkey.currentState != null) {
                      final bool passed = _formkey.currentState!.validate();
                      print(passed);
                      if (passed) {
                        setState(() {
                          _verificationStatus = VerificationStatus.codeSent;
                        });
                      }
                    }
                  },
                  child: const Text('인증문자 발송'),
                ),
                const SizedBox(
                  height: common_sm_padding,
                ),
                AnimatedOpacity(
                  duration: duration,
                  opacity:
                      (_verificationStatus == VerificationStatus.none) ? 0 : 1,
                  curve: Curves.easeInOut,
                  child: AnimatedContainer(
                    height: getVerificationHeight(_verificationStatus),
                    curve: Curves.easeInOut,
                    duration: duration,
                    child: TextFormField(
                      controller: _codeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [MaskedInputFormatter('000000')],
                      decoration: InputDecoration(
                        focusedBorder: inputBorder,
                        border: inputBorder,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                    height: getVerificationBtnHeight(_verificationStatus),
                    duration: duration,
                    curve: Curves.easeInOut,
                    child: TextButton(
                      onPressed: () {
                        attemptVerify(context);
                      },
                      child:
                          (_verificationStatus == VerificationStatus.verifying)
                              ? const CircularProgressIndicator(color: Colors.white,)
                              : const Text('인증'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  double getVerificationHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 60 + common_sm_padding;
    }
  }

  double getVerificationBtnHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 48;
    }
  }

  void attemptVerify(BuildContext context) async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
      // _verificationStatus = VerificationStatus.none;
    });

    // read가 아닌 watch를 쓰면 변경된 데이터 notifyListeners를 통해 다시 와서 무한루프를 돌게된다
    // 따라서 데이터를 변경할 때 는 read를 사용
    if (!mounted) return;
    context.read<UserProvider>().setUserAuth(true);
  }
}

enum VerificationStatus {
  none, // 아무것도 안된 상태
  codeSent, // 인증문자를 보낸 상태
  verifying, // 인증을 하고 있는 상태
  verificationDone, // 인증이 완료된 상태
}

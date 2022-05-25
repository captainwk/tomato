import 'package:dio/dio.dart';
import 'package:tomato/constants/keys.dart';
import 'package:tomato/utils/logger.dart';

class AddressService {
  // void diotest() async {
  // 에러를 처리하는 첫 번째 방법
  // try {
  //   var response = Dio().get('https://randomuser.me/api/');
  //   logger.d(response);
  // } catch(e) {
  //   logger.e(e);
  // }
  // 에러를 처리하는 두 번째 방법
  // var response = Dio().get('https://randomuser.me/api/').catchError((e) {
  //   logger.e(e.error);
  // });
  // logger.d(response);
  // }

  void searchAddressByStr(String text) async {
    final formData = {
      'key': VWORLD_KEY,
      'request': 'search',
      'type': 'ADDRESS',
      'category': 'ROAD',
      'query': text,
      'size': 30,
    };

    final response = await Dio()
        .get('http://api.vworld.kr/req/search', queryParameters: formData)
        // .get('http://api.vworld.kr/req/search?key=38F2640D-D1C1-3D67-90B5-DF30D9743FE8&request=search&type=ADDRESS&category=ROAD&query=$text')
        .catchError((e) {
      logger.e("error = ${e.message}");
    });
    logger.d(response);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:tomato/constants/common_size.dart';
import 'package:tomato/data/AddressModel.dart';
import 'package:tomato/screens/start/address_service.dart';
import 'package:tomato/utils/logger.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();

  AddressModel? _addressModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: common_padding),
      child: Column(
        children: [
          TextFormField(
            onFieldSubmitted: (text) async {
              _addressModel = await AddressService().searchAddressByStr(text);
              setState(() {

              });
            },
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
              onPressed: () async {
                Location location = new Location();

                bool _serviceEnabled;
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }

                _locationData = await location.getLocation();
                logger.d(_locationData);
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
                if (_addressModel == null ||
                    _addressModel!.result == null ||
                    _addressModel!.result!.items == null ||
                    _addressModel!.result!.items![index].address == null) {
                  return Container(
                    height: 10,
                    color: Colors.black,
                  );
                }
                return ListTile(
                  title: Text(
                      _addressModel!.result!.items![index].address!.road ?? ''),
                  subtitle: Text(
                      _addressModel!.result!.items![index].address!.parcel ?? ''),
                );
              },
              itemCount: (_addressModel == null ||
                      _addressModel!.result == null ||
                      _addressModel!.result!.items == null)
                  ? 0
                  : _addressModel!.result!.items!.length,
            ),
          ),
        ],
      ),
    );
  }
}

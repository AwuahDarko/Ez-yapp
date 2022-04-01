import 'dart:convert';

import 'package:esayapp/models/device.dart';
import 'package:esayapp/services/web.dart';

class DeviceProvider {
  Future<List<Device>> fetchDevices() async {
    List<Device> result = [];
    try {
      var res = await Web.makeGETF('/appliances');

      if (res == null) throw "An error occurred, please try again";

      var data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        List<dynamic> dev = data['data'] as List;
        for (var d in dev) {
          result.add(Device(d));
        }
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<Map<String, dynamic>> setDeviceStatus(Map<String, dynamic> body) async {
    try {
      var res = await Web.makePOSTF('/appliances', body);

      if (res == null) throw "An error occurred, please try again";

      var data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return data;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}

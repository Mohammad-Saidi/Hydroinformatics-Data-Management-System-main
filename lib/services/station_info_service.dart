import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hydroinformatics_data_management_system/helpers/helper_method.dart';

class StationInfoService {
  static Future<dynamic> stationInfo(value) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/get/station-info?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          body: {'data': value},
          headers: {'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'});

      if (response.statusCode == 200) {
        print('OK');
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print(response.statusCode);
        print('else');
        return data;
      }
    } catch (e) {
      print('catch');
      return data;
    }
  }
}

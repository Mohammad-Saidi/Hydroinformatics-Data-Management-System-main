import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/helper_method.dart';

class LogoutService {
  static Future<dynamic> userLogout() async {
    dynamic data;
    try {
      const url = 'http://103.141.9.234/himsmobappapi/api/v1/user/logout?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: {'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'});

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print('Else');
        return data;
      }
    } catch (e) {
      print('Catch');
      return data;
    }
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/helper_method.dart';

class DataAvailabilityService {
  static Future<dynamic> dataAvailability(
      subdivision, from_year, to_year) async {
    dynamic data;
    try {
      print('subdivision: ${subdivision}');
      print('from_year: ${from_year}');
      print('to_year: ${to_year}');
      const url = 'http://103.141.9.234/himsmobappapi/api/v1/swl/data/availability?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, body: {
        'subdivision': subdivision,
        'from_year': from_year,
        'to_year': to_year
      }, headers: {
        'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'
      });

      if (response.statusCode == 200) {
        print('OK');
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print('else');
        return data;
      }
    } catch (e) {
      print('catch');
      return data;
    }
  }
}

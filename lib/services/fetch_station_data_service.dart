import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../helpers/helper_method.dart';

class FetchStationDataService {
  static Future<dynamic> fetchHydroData(keyword, date) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/get/hydro/station-data?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          body: {'keyword': keyword, 'date': date},
          headers: {'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'});

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print(response.statusCode);
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      return data;
    }
  }

  static Future<dynamic> fetchFfwcData(keyword, date) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/get/ffwc/station-data?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          body: {'keyword': keyword, 'date': date},
          headers: {'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'});

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print(response.statusCode);
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}

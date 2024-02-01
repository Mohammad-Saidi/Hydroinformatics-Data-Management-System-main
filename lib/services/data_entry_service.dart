import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/helper_method.dart';

class DataEntryService {
  static Future<dynamic> ffwcSurfaceWaterDataEntry(
      selectedStationKeyword,
      datePickerController,
      sixAmController,
      nineAmController,
      twelvePmController,
      fifteenPmController,
      eighteenPmController,
      six,
      nine,
      twelve,
      fifteen,
      eighteen) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/ffwc/station-data/store?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, body: {
        'keyword': selectedStationKeyword,
        'date': datePickerController,
        'time': "$six,$nine,$twelve,$fifteen,$eighteen",
        'value':
            "$sixAmController,$nineAmController,$twelvePmController,$fifteenPmController,$eighteenPmController",
      }, headers: {
        'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'
      });

      if (response.statusCode == 200) {
        print('OK');
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print('else');
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      print('catch');
      return data;
    }
  }

  static Future<dynamic> ffwcRainfallDataEntry(selectedStationKeyword,
      datePickerController, sixAmController, six) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/ffwc/station-data/store?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, body: {
        'keyword': selectedStationKeyword,
        'date': datePickerController,
        'time': "$six",
        'value': "$sixAmController",
      }, headers: {
        'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'
      });

      if (response.statusCode == 200) {
        print('OK');
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print('else');
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      print('catch');
      return data;
    }
  }

  static Future<dynamic> hydroDataEntry(selectedStationKeyword,
      datePickerController, nineAmController, nine) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/hydro/station-data/store?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, body: {
        'keyword': selectedStationKeyword,
        'date': datePickerController,
        'time': "$nine",
        'value': "$nineAmController",
      }, headers: {
        'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'
      });

      if (response.statusCode == 200) {
        print('OK');
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print('else');
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      print('catch');
      return data;
    }
  }
}

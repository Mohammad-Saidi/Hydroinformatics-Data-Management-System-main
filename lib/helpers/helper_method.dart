import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HelperMethod {
  static String? authToken;
  static String? userName;
  static String status = '';

  static setUserId(String id) async {
    final Loginpref = await SharedPreferences.getInstance();
    Loginpref.setString('userID', id);
  }

  static Future<String?> getUserId() async {
    final Loginpref = await SharedPreferences.getInstance();
    String? loginData = Loginpref.getString('userID');
    return loginData;
  }

  static setUserName(String name) async {
    final Namepref = await SharedPreferences.getInstance();
    Namepref.setString('userName', name);
  }

  static Future<void> getUserName() async {
    final Namepref = await SharedPreferences.getInstance();
    userName = Namepref.getString('userName');
  }

  static void setAuthToken(String token) {
    authToken = token;
  }

  static String? getAuthToken() {
    return authToken;
  }

  static const String cameraPosition =
      'https://maps.app.goo.gl/RuRDc72JBZfxzsvp9';

  static Future<String> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      status = 'Mobile Data';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = 'Wifi Data';
    } else {
      status = 'Not Connected';
    }

    return status;
  }

  static String getFormattedDate(String date) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.parse(date));

    return formattedDate;
  }
}

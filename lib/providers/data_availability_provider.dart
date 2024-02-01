import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/data_availability_model.dart';
import 'package:hydroinformatics_data_management_system/services/data_availability_service.dart';

import '../main.dart';

class DataAvailabilityProvider extends ChangeNotifier {
  List<SwlDataAvailability> dataAvailabilityList = [];

  Future<dynamic> getWaterLevelAvailability(
      context, subdivision, from_year, to_year) async {
    dataAvailabilityList.clear();
    final data = await DataAvailabilityService.dataAvailability(
        subdivision, from_year, to_year);

    if (data != null) {
      if (data["status"] == "success") {
        DataAvailabilityModel dataAvailabilityModel =
            DataAvailabilityModel.fromJson(data);

        dataAvailabilityModel.swlDataAvailability!.forEach((element) {
          dataAvailabilityList.add(element);
        });
        notifyListeners();
      } else if (data["status"] == "error") {
        showDialog(
            barrierDismissible: false,
            context: navigatorKey.currentContext!,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  data['message'],
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });
      }

      return data;
    } else {
      showDialog(
          barrierDismissible: false,
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Oops! Something went wrong',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('OK'))
              ],
            );
          });

      return data;
    }
  }
}

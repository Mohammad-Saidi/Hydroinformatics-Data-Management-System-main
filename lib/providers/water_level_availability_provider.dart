import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/water_level_availability_model.dart';

import '../main.dart';
import '../services/water_level_availibility_service.dart';

class WaterLevelAvailabilityProvider extends ChangeNotifier {
  List<SurfaceWaterList> surfaceWaterList = [];

  Future<void> getWaterLevelAvailability(context) async {
    surfaceWaterList.clear();
    final data = await WaterLevelAvailabilityService.waterLevelAvailability();

    if (data != null) {
      if (data["status"] == "success") {
        WaterLevelAvailabilityModel waterLevelAvailabilityModel =
            WaterLevelAvailabilityModel.fromJson(data);

        waterLevelAvailabilityModel.surfaceWaterList!.forEach((element) {
          surfaceWaterList.add(element);
        });
        notifyListeners();
      }
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
                      //SystemNavigator.pop();
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }
}

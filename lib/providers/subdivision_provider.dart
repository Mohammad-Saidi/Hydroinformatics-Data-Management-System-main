import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/subdivision_model.dart';
import 'package:hydroinformatics_data_management_system/services/subdivision_service.dart';

import '../main.dart';

class SubdivisionProvider extends ChangeNotifier {
  List<SubDivisionList> subDivisionList = [];
  List<String> allSubDivisionList = [];
  List<String> allDivisionCodeList = [];
  String filteredSubdivisionCode = '';

  Future<void> getSubdivision(context, value) async {
    subDivisionList.clear();
    final data = await SubdivisionService.subdivisionInfo(value);

    if (data != null) {
      if (data["status"] == "success") {
        SubdivisionModel subdivisionModel = SubdivisionModel.fromJson(data);
        subdivisionModel.subDivisionList!.forEach((element) {
          subDivisionList.add(element);
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

  void getSubdivisionList() {
    allSubDivisionList.clear();
    subDivisionList.forEach((element) {
      allSubDivisionList.add(element.subdivisionName ?? '');
    });
    notifyListeners();
  }

  void getSubdivisionCodeList() {
    allDivisionCodeList.clear();
    subDivisionList.forEach((element) {
      allDivisionCodeList.add(element.hydsubdivcode ?? '');
    });
    notifyListeners();
  }

  void getfilteredSubdivisionCode(subdivision) {
    subDivisionList.forEach((element) {
      if (element.subdivisionName == subdivision) {
        filteredSubdivisionCode = element.hydsubdivcode!;
      }
    });
    notifyListeners();
  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/providers/data_availability_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/subdivision_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'data_availability_list_page.dart';

class WaterLevelAvailabilitySearchPage extends StatefulWidget {
  const WaterLevelAvailabilitySearchPage({super.key});

  static const waterLevelAvailabilitySearchPage =
      'waterLevelAvailabilitySearchPage';

  @override
  State<WaterLevelAvailabilitySearchPage> createState() =>
      _WaterLevelAvailabilitySearchPageState();
}

class _WaterLevelAvailabilitySearchPageState
    extends State<WaterLevelAvailabilitySearchPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  late SubdivisionProvider subdivisionProvider;
  late DataAvailabilityProvider dataAvailabilityProvider;
  bool callOnce = true;
  dynamic selectedDivision;
  dynamic selectedDivisionCode;

  @override
  void didChangeDependencies() {
    subdivisionProvider = Provider.of(context, listen: true);
    dataAvailabilityProvider = Provider.of(context);
    if (callOnce) {
      subdivisionProvider.getSubdivisionList();
      subdivisionProvider.getSubdivisionCodeList();
      callOnce = false;
    }
    super.didChangeDependencies();
    selectedDivision = subdivisionProvider.allSubDivisionList[0];
    selectedDivisionCode = subdivisionProvider.allDivisionCodeList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Data Availability Search Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  DropdownSearch<String>(
                    items: subdivisionProvider.allSubDivisionList,
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                    ),
                    dropdownButtonProps: const DropdownButtonProps(
                      color: Colors.black,
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      textAlignVertical: TextAlignVertical.center,
                      dropdownSearchDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 8, right: 8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1))),
                    ),
                    onChanged: (value) {
                      selectedDivision = value.toString();
                      subdivisionProvider
                          .getfilteredSubdivisionCode(selectedDivision);
                      selectedDivisionCode =
                          subdivisionProvider.filteredSubdivisionCode;
                      setState(() {
                        print('test: $selectedDivisionCode');
                      });
                    },
                    selectedItem: selectedDivision,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'From Date',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'To Date',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select a year';
                            }
                          },
                          controller: fromDateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('yyyy').format(pickedDate);
                                    print('From date: $formattedDate');
                                    setState(() {
                                      fromDateController.text = formattedDate;
                                    });
                                  } else {}
                                },
                                icon: const Icon(
                                  Icons.date_range,
                                  color: Colors.blue,
                                )),
                            contentPadding: const EdgeInsets.only(
                                left: 8, right: 8, top: 15, bottom: 15),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select a year';
                            }
                          },
                          controller: toDateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('yyyy').format(pickedDate);
                                    print('to date: ${formattedDate}');
                                    setState(() {
                                      toDateController.text = formattedDate;
                                    });
                                  } else {}
                                },
                                icon: const Icon(
                                  Icons.date_range,
                                  color: Colors.blue,
                                )),
                            contentPadding: const EdgeInsets.only(
                                left: 8, right: 8, top: 15, bottom: 15),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          EasyLoading.show();
                          dataAvailabilityProvider
                              .getWaterLevelAvailability(
                                  context,
                                  selectedDivisionCode,
                                  fromDateController.text,
                                  toDateController.text)
                              .then((value) {
                            EasyLoading.dismiss();
                            if (value != null) {
                              if (value["status"] == "success") {
                                Navigator.of(context).pushNamed(
                                    DataAvailabilityListPage
                                        .dataAvailabilityListPage);
                              }
                            }
                          });
                        }
                      },
                      child: Text('Show Data',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

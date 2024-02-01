import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/hydro_graph_model.dart';
import 'package:hydroinformatics_data_management_system/providers/graph_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/station_info_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HydroGraphPage extends StatefulWidget {
  const HydroGraphPage({super.key});

  static const String hydroGraphPage = 'hydroGraphPage';

  @override
  State<HydroGraphPage> createState() => _HydroGraphPageState();
}

class _HydroGraphPageState extends State<HydroGraphPage> {
  late StationInfoProvider stationInfoProvider;
  bool callOnce = false;
  dynamic selectedStation;
  dynamic selectedKeyword;
  TextEditingController toDateController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late GraphProvider graphProvider;

  @override
  void didChangeDependencies() {
    stationInfoProvider = Provider.of(context, listen: true);
    graphProvider = Provider.of(context, listen: true);
    if (callOnce == false && stationInfoProvider.stationInfo.isNotEmpty) {
      stationInfoProvider.stationName.clear();
      stationInfoProvider.getStationName();
      selectedStation = stationInfoProvider.stationName[0];
      selectedKeyword = stationInfoProvider.getStationKeyword(selectedStation);
      callOnce = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Ground Water Graph',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: stationInfoProvider.stationInfo.isEmpty
                ? Text(
                    'Nothing to show ...',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  )
                : Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Well ID',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownSearch<String>(
                          items: stationInfoProvider.stationName,
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
                            setState(() async {
                              selectedStation = value.toString();
                              selectedKeyword = stationInfoProvider
                                  .getStationKeyword(selectedStation);
                            });
                          },
                          selectedItem: selectedStation,
                        ),
                        const SizedBox(
                          height: 15,
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
                                    return 'Select a date';
                                  }
                                },
                                controller: fromDateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print('From date: ${formattedDate}');
                                          setState(() {
                                            fromDateController.text =
                                                formattedDate;
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
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
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
                                    return 'Select a date';
                                  }
                                },
                                controller: toDateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print('to date ${formattedDate}');
                                          setState(() {
                                            toDateController.text =
                                                formattedDate;
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
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                graphProvider
                                    .showHydroGraph(
                                        selectedKeyword,
                                        fromDateController.text,
                                        toDateController.text,
                                        context)
                                    .then((value) {
                                  graphProvider.hydroDataList
                                      .forEach((element) {
                                    print(element.logDate);
                                  });

                                  if (graphProvider.hydroDataList.isNotEmpty) {
                                    showDialog<String>(
                                        context: context,
                                        builder:
                                            (BuildContext context) =>
                                                AlertDialog(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  insetPadding:
                                                      const EdgeInsets.all(10),
                                                  content: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 40,
                                                          ),
                                                          Text(
                                                            "Well Name: $selectedStation",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          SfCartesianChart(
                                                              primaryXAxis:
                                                                  const CategoryAxis(
                                                                      title: AxisTitle(
                                                                          text:
                                                                              'Date')),
                                                              primaryYAxis:
                                                                  const NumericAxis(
                                                                      title: AxisTitle(
                                                                          text:
                                                                              'WT(m)')),
                                                              series: <CartesianSeries>[
                                                                // Renders line chart
                                                                LineSeries<
                                                                        Data, String>(
                                                                    dataSource:
                                                                        graphProvider
                                                                            .hydroDataList,
                                                                    xValueMapper: (Data
                                                                                data,
                                                                            _) =>
                                                                        data
                                                                            .logDate,
                                                                    yValueMapper: (Data
                                                                                data,
                                                                            _) =>
                                                                        num.parse(
                                                                            data.waterLvl!))
                                                              ]),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: ListView
                                                                .builder(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              itemCount:
                                                                  graphProvider
                                                                      .hydroDataList
                                                                      .length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  elevation: 5,
                                                                  color: Colors
                                                                      .blue,
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        "Date: ${graphProvider.hydroDataList[index].logDate}",
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.white),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Table(
                                                                          border:
                                                                              TableBorder.all(color: Colors.white),
                                                                          children: [
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    'Time',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    'WT(m)',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    "9:00",
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    graphProvider.hydroDataList[index].waterLvl!,
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                elevation: 5,
                                                                backgroundColor:
                                                                    Colors.blue,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8))),
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: Text('Close',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                  } else if (graphProvider
                                      .hydroDataList.isEmpty) {
                                    var snackBar = const SnackBar(
                                        content: Text(
                                            'Your selected date range has no data'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                });
                              }
                            },
                            child: Text('Show Graph',
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

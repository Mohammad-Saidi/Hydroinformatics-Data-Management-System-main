import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/providers/data_availability_provider.dart';
import 'package:provider/provider.dart';

class DataAvailabilityListPage extends StatefulWidget {
  const DataAvailabilityListPage({super.key});

  static const String dataAvailabilityListPage = 'dataAvailabilityListPage';

  @override
  State<DataAvailabilityListPage> createState() =>
      _DataAvailabilityListPageState();
}

class _DataAvailabilityListPageState extends State<DataAvailabilityListPage> {
  late DataAvailabilityProvider dataAvailabilityProvider;

  @override
  void didChangeDependencies() {
    dataAvailabilityProvider = Provider.of(context, listen: true);

    super.didChangeDependencies();
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
          'Available Data',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      dataAvailabilityProvider.dataAvailabilityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Text(
                            "Station Name : ${dataAvailabilityProvider.dataAvailabilityList[index].stationName}",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Year : ${dataAvailabilityProvider.dataAvailabilityList[index].yearVal}",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              border: TableBorder.all(color: Colors.white),
                              children: [
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'Month',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'Data',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "January",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .jan! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "February",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .feb! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "March",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .mar! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "April",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .apr! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "May",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .may! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "June",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .jun! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "July",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .jul! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "August",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .aug! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "September",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .sep! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "October",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .oct! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "November",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .nov! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "December",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        dataAvailabilityProvider
                                                .dataAvailabilityList[index]
                                                .dec! ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}

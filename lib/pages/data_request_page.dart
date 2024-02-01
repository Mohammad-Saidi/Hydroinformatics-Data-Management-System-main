import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hydroinformatics_data_management_system/pages/data_request_details_page.dart";
import "package:provider/provider.dart";

import "../providers/data_request_provider.dart";

class DataRequestPage extends StatefulWidget {
  const DataRequestPage({super.key});

  static const String dataRequestPage = 'dataRequestPage';

  @override
  State<DataRequestPage> createState() => _DataRequestPageState();
}

class _DataRequestPageState extends State<DataRequestPage> {
  bool callOnce = true;
  late DataRequestProvider dataRequestProvider;

  @override
  void didChangeDependencies() {
    dataRequestProvider = Provider.of(context, listen: true);
    if (callOnce) {
      dataRequestProvider.getDataRequestInfo(context).then((value) {
        dataRequestProvider.getDataRequestList();
      });
      callOnce = false;
    }

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
          'Data Request (Pending)',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                dataRequestProvider.dataRequestList.isEmpty
                    ? Center(
                        child: Text(
                        'No pending data request .....',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dataRequestProvider.dataRequestList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  DataRequestDetailsPage.dataRequestDetailsPage,
                                  arguments: dataRequestProvider
                                      .dataRequestList[index].reqMasId);
                            },
                            child: Card(
                                color: Colors.lightBlue.withOpacity(.5),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.blueAccent)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'User Name: ${dataRequestProvider.dataRequestList[index].userName}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          'Email: ${dataRequestProvider.dataRequestList[index].email}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          'Contact: ${dataRequestProvider.dataRequestList[index].mobileNo}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          'Request Type: ${dataRequestProvider.dataRequestList[index].category}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          'Invoice Date: ${dataRequestProvider.dataRequestList[index].requestDate}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                    ],
                                  ),
                                )),
                          );
                        }),
              ],
            ),
          )),
    );
  }
}

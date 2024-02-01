import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hydroinformatics_data_management_system/helpers/helper_method.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  static const String contactPage = 'contactPage';

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(23.753380179501324, 90.38874106875791),
    zoom: 16,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: GoogleMap(
                      markers: {
                        const Marker(
                          markerId: MarkerId('1'),
                          position:
                              LatLng(23.753380179501324, 90.38874106875791),
                        )
                      },
                      compassEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: cameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 30,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      _launchUrl();
                    },
                    child: Text('Find Location',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white))),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Superintending Engineer\nProcessing and Flood Forecasting Circle,\nBangladesh Water Development Board,\n72-Green Road, Dhaka-1215, Bangladesh.',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Email: se.pffc@bwdb.gov.bd',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Phone: +88-02-58151530',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Mobile: 01765-527070',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Web: www.hydrology.bwdb.gov.bd',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('www.ffwc.gov.bd',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Visit: www.bwdb.gov.bd',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse(HelperMethod.cameraPosition))) {
      throw Exception('Could not launch the URL');
    }
  }
}

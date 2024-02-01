import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/custom/drawer.dart';
import 'package:hydroinformatics_data_management_system/pages/services_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomePageDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Categories',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ServicesPage.servicesPage, arguments: 'PFWC');
                    },
                    child: Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/climatology.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('PFFC',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ServicesPage.servicesPage, arguments: 'FFWC');
                    },
                    child: Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/evaporation.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('FFWC',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ServicesPage.servicesPage);
                    },
                    child: Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/sunshine.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('KFWC',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ServicesPage.servicesPage);
                    },
                    child: Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/tidal.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('UFWC',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

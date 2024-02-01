import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/providers/registration_status_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/user_registration_provider.dart';
import 'package:provider/provider.dart';

import '../providers/user_details_provider.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  static const String userRegistrationPage = 'userRegistrationPage';

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  late UserRegistrationProvider userRegistrationProvider;
  late UserDetailsProvider userDetailsProvider;
  late RegistrationStatusProvider registrationStatusProvider;
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    userRegistrationProvider = Provider.of(context, listen: true);
    registrationStatusProvider = Provider.of(context, listen: true);
    userDetailsProvider = Provider.of(context);

    if (callOnce) {
      userRegistrationProvider.getRegistrationInfo(context).then((value) {
        userRegistrationProvider.getPendingRegistrationInfo();
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
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'User Registration (Pending)',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: userRegistrationProvider.dataList.isEmpty
                  ? Center(
                      child: Text(
                      'No pending registration request .....',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ))
                  : ListView.builder(
                      itemCount: userRegistrationProvider.dataList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            userDetailsProvider
                                .getUserInfo(
                                    userRegistrationProvider
                                        .dataList[index].userId,
                                    context)
                                .then((value) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    Builder(builder: (context) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        dialogBackgroundColor: Colors.blue),
                                    child: AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding: const EdgeInsets.all(10),
                                      title: Center(
                                        child: Text('User Details',
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)),
                                      ),
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'User Type: ${userDetailsProvider.userDetailsModel!.userDetails!.userTypeName}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Name: ${userDetailsProvider.userDetailsModel!.userDetails!.name}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Phone: ${userDetailsProvider.userDetailsModel!.userDetails!.mobileNo}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Mobile: ${userDetailsProvider.userDetailsModel!.userDetails!.mobileNo}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Email: ${userDetailsProvider.userDetailsModel!.userDetails!.email}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'National ID: ${userDetailsProvider.userDetailsModel!.userDetails!.nationalId}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    userDetailsProvider
                                                                .userDetailsModel!
                                                                .userDetails!
                                                                .officePhone ==
                                                            null
                                                        ? 'Office Phone: '
                                                        : 'Office Phone: ${userDetailsProvider.userDetailsModel!.userDetails!.officePhone}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Address: ${userDetailsProvider.userDetailsModel!.userDetails!.residenceAddress}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                if (userDetailsProvider
                                                        .userDetailsModel!
                                                        .userDetails!
                                                        .userTypeName ==
                                                    'Student')
                                                  Text(
                                                      'Student ID: ${userDetailsProvider.userDetailsModel!.userDetails!.studentId}',
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .white)),
                                                if (userDetailsProvider
                                                        .userDetailsModel!
                                                        .userDetails!
                                                        .userTypeName ==
                                                    'Student')
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                Text(
                                                    'User Name: ${userDetailsProvider.userDetailsModel!.userDetails!.userName}',
                                                    maxLines: 2,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                const SizedBox(
                                                  height: 35,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          registrationStatusProvider
                                                              .getRegistrationStatus(
                                                                  userDetailsProvider
                                                                      .userDetailsModel!
                                                                      .userDetails!
                                                                      .userId,
                                                                  'private')
                                                              .then((value) {
                                                            if (value != null) {
                                                              if (value[
                                                                      'status'] ==
                                                                  'success') {
                                                                Fluttertoast
                                                                    .showToast(
                                                                  msg: value[
                                                                      'message'],
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                );

                                                                userRegistrationProvider
                                                                    .getRegistrationInfo(
                                                                        context)
                                                                    .then(
                                                                        (value) {
                                                                  userRegistrationProvider
                                                                      .getPendingRegistrationInfo();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              }
                                                            } else {
                                                              showDialog<
                                                                  String>(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    AlertDialog(
                                                                  content:
                                                                      const Text(
                                                                          'Oops! Something went wrong'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                          });
                                                        },
                                                        child: Text('Approve',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          registrationStatusProvider
                                                              .getRegistrationStatus(
                                                                  userDetailsProvider
                                                                      .userDetailsModel!
                                                                      .userDetails!
                                                                      .userId,
                                                                  'reject')
                                                              .then((value) {
                                                            if (value != null) {
                                                              if (value[
                                                                      'status'] ==
                                                                  'success') {
                                                                Fluttertoast
                                                                    .showToast(
                                                                  msg: value[
                                                                      'message'],
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                );

                                                                userRegistrationProvider
                                                                    .getRegistrationInfo(
                                                                        context)
                                                                    .then(
                                                                        (value) {
                                                                  userRegistrationProvider
                                                                      .getPendingRegistrationInfo();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              }
                                                            } else {
                                                              showDialog<
                                                                  String>(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    AlertDialog(
                                                                  content:
                                                                      const Text(
                                                                          'Oops! Something went wrong'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                          });
                                                        },
                                                        child: Text('Reject',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            });
                          },
                          child: Card(
                              color: Colors.lightBlue.withOpacity(.5),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.blueAccent)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Full Name: ${userRegistrationProvider.dataList[index].name}',
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Mobile: ${userRegistrationProvider.dataList[index].mobileNo}',
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Email: ${userRegistrationProvider.dataList[index].email}',
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Date: ${userRegistrationProvider.dataList[index].createDatetime}',
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              )),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}

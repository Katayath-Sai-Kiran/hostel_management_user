import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';
import 'package:hostel_management_user/screens/complaints.dart';
import 'package:iconsax/iconsax.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        iconTheme: const IconThemeData(color: kWhiteColor),
        centerTitle: true,
        title: Text(
          'Account',
          style: GoogleFonts.poppins(color: kWhiteColor),
        ),
      ),
      backgroundColor: kWhiteColor,
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc('F09mh8Ngvjhp5vF0g2UG')
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(kPrimaryColor),
              ));
            }

            Map? user = userSnapshot.data?.data() as Map;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24.0),
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -20,
                              right: -20,
                              child: Container(
                                height: Get.height * 0.09,
                                width: Get.height * 0.09,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  color: Colors.yellow.shade600,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -15,
                              right: -(Get.width * 0.15),
                              child: Container(
                                height: Get.height * 0.01,
                                width: Get.height * 0.01,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.yellow.shade600,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              right: -(Get.width * 0.2),
                              child: Container(
                                height: Get.height * 0.015,
                                width: Get.height * 0.015,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.0),
                                    color: Colors.yellow.shade600),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              left: -20,
                              child: Container(
                                height: Get.height * 0.08,
                                width: Get.height * 0.08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -10,
                              left: -(Get.width * 0.25),
                              child: Container(
                                height: Get.height * 0.02,
                                width: Get.height * 0.02,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -15,
                              left: -(Get.width * 0.15),
                              child: Container(
                                height: Get.height * 0.01,
                                width: Get.height * 0.01,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * 0.12,
                              width: Get.height * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.purple.shade800,
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                height: Get.height * 0.1,
                                width: Get.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Icon(
                                  Iconsax.user,
                                  color: kWhiteColor,
                                  size: 48.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Text(
                        user['name'] ?? 'NA',
                        style: GoogleFonts.poppins(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        user['phoneNumber'] ?? 'NA',
                        style: GoogleFonts.poppins(fontSize: 17.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        user['email'] ?? 'NA',
                        style: GoogleFonts.poppins(fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                    color: kPrimaryColor.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const ComplientScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Complients',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_outlined,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Complients',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_outlined,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                Center(
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(12.0),
                            onTap: () {
                              Get.dialog(
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(24.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: kWhiteColor,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 24.0),
                                          Text(
                                            'Are you sure, you want to logout !',
                                            style: GoogleFonts.karla(
                                              fontSize: 17.0,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          const SizedBox(height: 24.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                kPrimaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                child: Text(
                                                  'Cancel',
                                                  style: GoogleFonts.poppins(
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          kPrimaryColor
                                                              .withOpacity(0.8),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0))),
                                                  child: Text(
                                                    'Logout',
                                                    style: GoogleFonts.poppins(
                                                      color: kWhiteColor,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(height: 24.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: kPrimaryColor.withOpacity(0.8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Iconsax.logout,
                                    color: kWhiteColor,
                                  ),
                                  const SizedBox(width: 12.0),
                                  Text(
                                    'Logout',
                                    style:
                                        GoogleFonts.poppins(color: kWhiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

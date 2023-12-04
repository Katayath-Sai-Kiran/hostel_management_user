import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';
import 'package:hostel_management_user/screens/account.dart';
import 'package:hostel_management_user/screens/notifications.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Garage X',
          style: GoogleFonts.poppins(color: kWhiteColor),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => const NotificationScreen());
                },
                icon: const Icon(Iconsax.notification),
                color: kWhiteColor,
              ),
              Positioned(
                  right: 8,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Text(
                      '8',
                      style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: 10,
                      ),
                    ),
                  ))
            ],
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const AccountScreen());
            },
            icon: const Icon(Iconsax.user),
            color: kWhiteColor,
          ),
          const SizedBox(width: 15.0)
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('rooms')
              .where('activeUsers', arrayContains: 'F09mh8Ngvjhp5vF0g2UG')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> roomSnapshot) {
            if (roomSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                ),
              );
            }

            Map room = roomSnapshot.data?.docs.first.data() as Map;
            room['id'] = roomSnapshot.data?.docs.first.id;
            final int keyStatus = room['keyStatus'] ?? 1;

            log(room.toString());
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            keyStatus == 1
                                ? 'Keys are at Dining'
                                : keyStatus == 2
                                    ? 'Doors are open'
                                    : 'I\'ve the keys',
                            style: GoogleFonts.poppins(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.zero,
                            tooltip: 'Change keys status',
                            onPressed: () {
                              Get.bottomSheet(UpdateKeyStateSheet(
                                roomId: room['id'],
                                keyStatus: room['keyStatus'],
                              ));
                            },
                            icon: Icon(
                              Iconsax.repeat5,
                              color: kPrimaryColor,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Beds',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                        fontSize: 21.0),
                  ),
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('beds')
                            .where('roomId', isEqualTo: room['id'])
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> bedSnapshot) {
                          if (bedSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(kPrimaryColor),
                              ),
                            );
                          }

                          List<Map> beds = (bedSnapshot.data?.docs ?? [])
                              .map((e) => e.data() as Map)
                              .toList();
                          return GridView.builder(
                              shrinkWrap: true,
                              itemCount: beds.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.75,
                                      crossAxisCount: 2),
                              itemBuilder: (conetext, index) {
                                Map currentBed = beds[index];
                                bool isMyBed = currentBed['activeUserId'] ==
                                    'F09mh8Ngvjhp5vF0g2UG';
                                return FlipCard(
                                  back: StreamBuilder<DocumentSnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(currentBed['activeUserId'])
                                          .snapshots(),
                                      builder: (context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              userSnapshot) {
                                        if (userSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      kPrimaryColor),
                                            ),
                                          );
                                        }
                                        Map? user =
                                            userSnapshot.data!.data() as Map?;

                                        if (user == null) {
                                          return Card(
                                            child: Center(
                                              child: Text('Not Alloted',
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          );
                                        }

                                        return Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                      Iconsax.user,
                                                      color: kPrimaryColor,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16.0),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6,
                                                      vertical: 4.0),
                                                  decoration: BoxDecoration(
                                                      color: kPrimaryColor
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0)),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Iconsax.emoji_happy,
                                                        size: 14.0,
                                                      ),
                                                      const SizedBox(
                                                          width: 8.0),
                                                      Text(
                                                        user['name'] ?? 'NA',
                                                        style:
                                                            GoogleFonts.karla(
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6,
                                                      vertical: 4.0),
                                                  decoration: BoxDecoration(
                                                      color: kPrimaryColor
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0)),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Iconsax.call,
                                                          size: 14.0),
                                                      const SizedBox(
                                                          width: 8.0),
                                                      Flexible(
                                                        child: Text(
                                                          user['phoneNumber'] ??
                                                              'NA',
                                                          style:
                                                              GoogleFonts.karla(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6,
                                                      vertical: 4.0),
                                                  decoration: BoxDecoration(
                                                      color: kPrimaryColor
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0)),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Iconsax.magic_star,
                                                        size: 14.0,
                                                      ),
                                                      const SizedBox(
                                                          width: 8.0),
                                                      Flexible(
                                                        child: Text(
                                                          user['email'] ?? 'NA',
                                                          style:
                                                              GoogleFonts.karla(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  fill: Fill.fillBack,
                                  flipOnTouch: true,
                                  front: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.purple.shade50,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Center(
                                      child: Text(
                                        '0${(index + 1)}',
                                        style: GoogleFonts.karla(
                                            fontSize: 72.0,
                                            fontWeight: FontWeight.bold,
                                            color: kPrimaryColor.withOpacity(
                                                isMyBed ? 0.5 : 0.2)),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class UpdateKeyStateSheet extends StatelessWidget {
  const UpdateKeyStateSheet(
      {super.key, required this.roomId, required this.keyStatus});

  final String roomId;
  final int keyStatus;

  @override
  Widget build(BuildContext context) {
    int updatedKeyState = keyStatus;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kWhiteColor,
      ),
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.6,
      ),
      child: StatefulBuilder(builder: (context, keyState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Change Keys \nStatus',
                style:
                    GoogleFonts.poppins(color: kPrimaryColor, fontSize: 32.0),
              ),
              const SizedBox(height: 32.0),
              InkWell(
                onTap: () {
                  keyState(() {
                    updatedKeyState = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: updatedKeyState == 1
                          ? Border.all(color: kPrimaryColor, width: 2)
                          : null,
                      color: updatedKeyState == 1
                          ? kPrimaryColor.withOpacity(0.2)
                          : kPrimaryColor.withOpacity(0.1),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: ListTile(
                    title: Text(
                      'Dining',
                      style: GoogleFonts.poppins(color: kPrimaryColor),
                    ),
                    trailing:
                        updatedKeyState == 1 ? const Icon(Icons.done) : null,
                    tileColor: kPrimaryColor,
                    enabled: true,
                    selectedTileColor: kPrimaryColor,
                    selectedColor: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              InkWell(
                onTap: () {
                  keyState(() {
                    updatedKeyState = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: updatedKeyState == 2
                          ? Border.all(color: kPrimaryColor, width: 2)
                          : null,
                      color: updatedKeyState == 2
                          ? kPrimaryColor.withOpacity(0.2)
                          : kPrimaryColor.withOpacity(0.1),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(
                        12.0,
                      )),
                  child: ListTile(
                    title: Text(
                      'Open',
                      style: GoogleFonts.poppins(color: kPrimaryColor),
                    ),
                    trailing:
                        updatedKeyState == 2 ? const Icon(Icons.done) : null,
                    tileColor: kPrimaryColor,
                    enabled: true,
                    selectedTileColor: kPrimaryColor,
                    selectedColor: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              InkWell(
                onTap: () {
                  keyState(() {
                    updatedKeyState = 3;
                  });

                  log(updatedKeyState.toString());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: updatedKeyState == 3
                          ? Border.all(color: kPrimaryColor, width: 2)
                          : null,
                      color: updatedKeyState == 3
                          ? kPrimaryColor.withOpacity(0.2)
                          : kPrimaryColor.withOpacity(0.1),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(
                        12.0,
                      )),
                  child: ListTile(
                    title: Text(
                      'I\'ve the Keys',
                      style: GoogleFonts.poppins(color: kPrimaryColor),
                    ),
                    trailing:
                        updatedKeyState == 3 ? const Icon(Icons.done) : null,
                    tileColor: kPrimaryColor,
                    enabled: true,
                    selectedTileColor: kPrimaryColor,
                    selectedColor: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('rooms')
                          .doc(roomId)
                          .update({'keyStatus': updatedKeyState});

                      DocumentSnapshot userDocument = await FirebaseFirestore
                          .instance
                          .collection('users')
                          .doc('F09mh8Ngvjhp5vF0g2UG')
                          .get();

                      Map user = userDocument.data() as Map;

                      await FirebaseFirestore.instance
                          .collection('activity')
                          .add({
                        'userId': userDocument.id,
                        'roomId': roomId,
                        'activity': "${user['name']} updated the key's status",
                        'status': updatedKeyState,
                      });
                      Get.back();
                      Fluttertoast.showToast(
                          msg: 'Key status updated successfully');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        backgroundColor: kPrimaryColor.withOpacity(0.8),
                        fixedSize: Size(Get.width * 0.9, 56.0)),
                    child: Text(
                      'Update',
                      style: GoogleFonts.karla(color: kWhiteColor),
                    )),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        );
      }),
    );
  }
}

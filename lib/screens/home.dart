import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';
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
                onPressed: () {},
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
            onPressed: () {},
            icon: const Icon(Iconsax.user),
            color: kWhiteColor,
          ),
          const SizedBox(width: 15.0)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Keys are at Dining',
                      style: GoogleFonts.poppins(
                          color: kPrimaryColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      tooltip: 'Change keys status',
                      onPressed: () {
                        Get.bottomSheet(const UpdateKeyStateSheet());
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
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.75,
                      crossAxisCount: 2),
                  itemBuilder: (conetext, index) {
                    return FlipCard(
                      back: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Iconsax.emoji_happy,
                                      size: 14.0,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'Venky',
                                      style: GoogleFonts.karla(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Iconsax.call,
                                      size: 14.0,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Flexible(
                                      child: Text(
                                        '+91 9110518247',
                                        style: GoogleFonts.karla(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Iconsax.magic_star,
                                      size: 14.0,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Flexible(
                                      child: Text(
                                        'venkypotham@gmail.com',
                                        style: GoogleFonts.karla(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      fill: Fill.fillBack,
                      flipOnTouch: true,
                      front: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text(
                            '0${(index + 1)}',
                            style: GoogleFonts.karla(
                                fontSize: 72.0,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor
                                    .withOpacity(index == 2 ? 0.5 : 0.2)),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class UpdateKeyStateSheet extends StatelessWidget {
  const UpdateKeyStateSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kWhiteColor,
      ),
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.6,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change Keys \nStatus',
              style: GoogleFonts.poppins(color: kPrimaryColor, fontSize: 32.0),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2),
                  color: kPrimaryColor.withOpacity(0.2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0)),
              child: ListTile(
                title: Text(
                  'Dining',
                  style: GoogleFonts.poppins(color: kPrimaryColor),
                ),
                trailing: const Icon(Icons.done),
                tileColor: kPrimaryColor,
                enabled: true,
                selectedTileColor: kPrimaryColor,
                selectedColor: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: kPrimaryColor, width: 2),
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  )),
              child: ListTile(
                title: Text(
                  'Open',
                  style: GoogleFonts.poppins(color: kPrimaryColor),
                ),
                // trailing: const Icon(Icons.done),
                tileColor: kPrimaryColor,
                enabled: true,
                selectedTileColor: kPrimaryColor,
                selectedColor: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: kPrimaryColor, width: 2),
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  )),
              child: ListTile(
                title: Text(
                  'I\'ve the Keys',
                  style: GoogleFonts.poppins(color: kPrimaryColor),
                ),
                // trailing: const Icon(Icons.done),
                tileColor: kPrimaryColor,
                enabled: true,
                selectedTileColor: kPrimaryColor,
                selectedColor: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                  onPressed: () {},
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
      ),
    );
  }
}

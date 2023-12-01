import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Payments Activity',
          style: GoogleFonts.poppins(color: kWhiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment History',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                  fontSize: 21.0),
            ),
            const SizedBox(height: 12.0),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8.0),
                    itemBuilder: (context, index) {
                      return FlipCard(
                        back: const Card(),
                        fill: Fill.fillBack,
                        flipOnTouch: true,
                        front: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  'Payment made on Thu, 15, Dec 2023',
                                  style: GoogleFonts.karla(),
                                ),
                                leading: Text(
                                  '0${(index + 1)}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                  ),
                                ),
                                trailing: Text(
                                  '8500/-',
                                  style: GoogleFonts.karla(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      );
                    },
                    itemCount: 15)),
            const SizedBox(height: 12.0),
            Container(
              width: Get.width,
              padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 12.0),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Next Payment In 10 Days',
                    style: GoogleFonts.poppins(
                        color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    child: Text(
                      'Pay',
                      style: GoogleFonts.poppins(color: kPrimaryColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

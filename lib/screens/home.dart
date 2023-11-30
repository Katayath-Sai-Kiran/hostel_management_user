import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.7,
                      crossAxisCount: 2),
                  itemBuilder: (conetext, index) {
                    return Container(
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
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

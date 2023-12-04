import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhiteColor),
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(color: kWhiteColor),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, _) => const Divider(),
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (context, index) {
          return ListTile(
            splashColor: kPrimaryColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            onTap: () {},
            horizontalTitleGap: 16.0,
            leading: CircleAvatar(
              backgroundColor: kPrimaryColor.withOpacity(0.2),
              child: const FaIcon(FontAwesomeIcons.kitchenSet, size: 18.0),
            ),
            title: Text(
              'Idle & Sambar for breakfast hope enjoy your meals',
              style: GoogleFonts.karla(),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          );
        },
        itemCount: 20,
      ),
    );
  }
}

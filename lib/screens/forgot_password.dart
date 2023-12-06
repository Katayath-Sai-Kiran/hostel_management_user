import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.1),
            Text(
              'Send password reset mail',
              style: GoogleFonts.poppins(
                fontSize: 48.0,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            TextFormField(
              key: _emailKey,
              onFieldSubmitted: (val) {
                _emailKey.currentState!.validate();
              },
              validator: (val) => val!.isEmpty || !val.isEmail
                  ? 'Please enter a valid email'
                  : null,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            ElevatedButton(
                onPressed: () async {
                  if (_emailKey.currentState!.validate()) {
                    // TODO add forgot password here
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: Size(Get.width, 56.0),
                ),
                child: Text(
                  'Send Link',
                  style: GoogleFonts.poppins(),
                ))
          ],
        ),
      ),
    );
  }
}

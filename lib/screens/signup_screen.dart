import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _password = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48.0),
            Text(
              'Welcome \nOnboard',
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
              textInputAction: TextInputAction.next,
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
            const SizedBox(height: 12.0),
            TextFormField(
              key: _password,
              onFieldSubmitted: (val) {
                _password.currentState!.validate();
              },
              textInputAction: TextInputAction.done,
              validator: (val) => val!.isEmpty || !val.isEmail
                  ? 'Please enter a valid email'
                  : null,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            SizedBox(height: Get.height * 0.05),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: Size(Get.width, 56.0),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(),
                ))
          ],
        ),
      ),
    );
  }
}

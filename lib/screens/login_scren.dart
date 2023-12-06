import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';
import 'package:hostel_management_user/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormFieldState> _numberKey = GlobalKey<FormFieldState>();
  final TextEditingController _numberController = TextEditingController();
  String get number => _numberController.text.trim();

  @override
  Widget build(BuildContext context) {
    log(kPrimaryColor.withOpacity(0.8).toString());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48.0),
                  Center(
                    child: SvgPicture.asset('assets/images/send_otp.svg',
                        height: Get.height * 0.4),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  TextFormField(
                    key: _numberKey,
                    onFieldSubmitted: (val) {
                      _numberKey.currentState!.validate();
                    },
                    textInputAction: TextInputAction.next,
                    validator: (val) => val!.isEmpty || !val.isPhoneNumber
                        ? 'Please enter a valid mobile number'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            ),
            Consumer<AuthController>(
                builder: (context, AuthController authController, _) {
              return ElevatedButton(
                  onPressed: () async {
                    if (_numberKey.currentState!.validate()) {
                      // TODO write login to send otp
                      authController.sendOtp(monbileNumber: number);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(Get.width, 56.0),
                  ),
                  child: Center(
                    child: authController.isSendingOtp
                        ? const CircularProgressIndicator()
                        : Text(
                            'Send OTP',
                            style: GoogleFonts.poppins(),
                          ),
                  ));
            }),
            const SizedBox(height: 32.0)
          ],
        ),
      ),
    );
  }
}

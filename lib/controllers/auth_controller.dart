import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hostel_management_user/screens/otp_screen.dart';

class AuthController extends ChangeNotifier {
  bool isSendingOtp = false;

  void changeOtpSendingStatus() {
    isSendingOtp = !isSendingOtp;
    notifyListeners();
  }

  Future sendOtp({required String monbileNumber}) async {
    try {
      changeOtpSendingStatus();
      await FirebaseAuth.instance.signInWithPhoneNumber('+91$monbileNumber');
      Fluttertoast.showToast(msg: 'Otp sent successfully');
      Get.to(() => const OtpScreen());
      changeOtpSendingStatus();
    } catch (error) {
      changeOtpSendingStatus();
      log('Error sending otp $error');
    }
  }
}

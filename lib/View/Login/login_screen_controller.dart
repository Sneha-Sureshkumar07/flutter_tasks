
import 'dart:io';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_1/Config/colours.dart';

import 'package:task_1/View/LastLogin/last_login_screen.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/model.dart';

class LoginScreenController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isOtpSend = false;

  String generatedOtp = '';
  int randomNumber = 0;
  String? city = '';
  String? ipAddress = '';
  String? date = '';
  String? time = '';
  DateTime now = DateTime.now();
  int remainingTime = 0;
  bool isResendButtonVisible = false;


  void generateOtp(context) async {
    final random = Random();
    generatedOtp = (1000 + random.nextInt(9999)).toString();
    isOtpSend = true;

    showOtpDialog(context);

  }

  void showOtpDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Your OTP',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: Text(
            generatedOtp,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                otpController.text = generatedOtp;

                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: MyColors.skyBlue,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }


  verifyOtp(context) async {
    if (otpController.text == generatedOtp) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        final random = Random();
        randomNumber = (10000 + random.nextInt(99999));

        try {
          for (var interface in await NetworkInterface.list()) {
            for (var address in interface.addresses) {
              if (address.type == InternetAddressType.IPv4) {
                ipAddress = address.address;
                break;
              }
            }
            if (ipAddress != null) break;
          }
        } catch (e) {
          ipAddress = 'Failed to get IP address';
        }

        date = '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}';
        time = '${now.hour == 0 ? 12 : now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';

        print("date$date");
        print("date$time");
        print("date$city");
        SavedDataEntry entry = SavedDataEntry(
          qrData: randomNumber.toString().isNotEmpty ? randomNumber.toString() : '',
          time: time.toString().isNotEmpty ? time.toString() : '',
          date: date.toString().isNotEmpty ? date.toString() : '',
          locationData: city.toString().isNotEmpty ? city.toString() : '',
          ipData: ipAddress.toString().isNotEmpty ? ipAddress.toString() : '',
        );

        List<String> savedData = prefs.getStringList('savedData') ?? [];
        savedData.add(entry.toString());

        await prefs.setStringList('savedData', savedData);
        print("savedData$savedData");

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LastLoginScreen(),
            ));

    } else {
        MotionToast.warning(
          description: Text(
              'Invalid OTP',
              style:
              TextStyle(fontSize: 15,fontWeight: FontWeight.bold)

          ),
          animationCurve: Curves.bounceIn,
          borderRadius: 0,
          animationDuration: const Duration(milliseconds: 1000),
          opacity: .9,
          position: MotionToastPosition.top,
        ).show(context);
      }
  }


  clearData(){
    isOtpSend = false;
    otpController.clear();
    phoneNumberController.clear();

  }
}

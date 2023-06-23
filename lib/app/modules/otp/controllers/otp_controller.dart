import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spaceparking/app/modules/login/views/login_view.dart';

import '../../../../db_helper.dart';

class OtpController extends GetxController {
  final DBHelper _dbHelper = DBHelper();

  Future<void> verifyOtp(List<TextEditingController> controls) async {
    String otp = '';
    for (var controller in controls) {
      otp += controller.text;
    }

    // Melakukan verifikasi OTP di database
    bool isVerified = await _dbHelper.verifyOtp(otp);

    if (isVerified) {
      // Jika OTP terverifikasi, navigasi ke halaman Login
      Get.offAll(LoginScreen());
    } else {
      // Jika OTP tidak terverifikasi, lakukan tindakan lain (misalnya menampilkan pesan error)
      // ...
    }
  }
}

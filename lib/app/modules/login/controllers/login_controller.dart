// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../../../routes/app_pages.dart';

// class LoginController extends GetxController {
//   // final username = ''.obs;
//   // final password = ''.obs;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void loginUser(String email, String password) async {
//     var url = 'http://192.168.41.96:5000/login';

//     // String email = "fahmi@gmail.com";
//     // String password = "fahmi123";

//     var body = {'email': email, 'password': password};
//     print(email);
//     print(password);
//     var response = await http.post(Uri.parse(url),
//         headers: {"Content-Type": "application/json"}, body: json.encode(body));
        
//     if (response.statusCode == 200) {
//       print("login berhasil");
//       Get.offAllNamed(Routes.NAVBAR);
//       var responseData = json.decode(response.body);
//       var token = responseData['token'];
//       print("Token: $token");
//     } else if (response.statusCode == 400) {
//       print("Terjadi kesalahan: ${response.body}");
//     } else {
//       print("terjadi kesalahan saat melakukan login");
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(String email, String password) async {
    var url = 'http://192.168.43.153:5000/login';

    var body = {'email': email, 'password': password};

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode == 200) {
      // Login berhasil
      Get.dialog(
        CupertinoAlertDialog(
          title: Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: CupertinoColors.systemGreen,
            size: 80,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Login Successful",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "You have successfully logged in!",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.offAllNamed(Routes.NAVBAR);
              },
              child: Text(
                "OK",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );

      var responseData = json.decode(response.body);
      var token = responseData['token'];
      print("Token: $token");
    } else {
      // Login gagal
      Get.dialog(
        CupertinoAlertDialog(
          title: Icon(
            CupertinoIcons.clear_circled_solid,
            color: CupertinoColors.systemRed,
            size: 80,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Login Failed",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Invalid email or password. Please try again.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "OK",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }
  }
}

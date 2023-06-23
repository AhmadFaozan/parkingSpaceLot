
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spaceparking/app/modules/login/views/login_view.dart';

import '../../../../db_helper.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late List<TextEditingController> controls;
  int numberOfFields = 5;

  final DBHelper _dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    controls = List.generate(
      numberOfFields,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (var controller in controls) {
      controller.dispose();
    }
    super.dispose();
  }

  void verifyOtp() async {
    String otp = '';
    for (var controller in controls) {
      otp += controller.text;
    }

    // Verify OTP in database and update is_verified column
    await _dbHelper.updateIsVerifiedInDatabase();

    // Navigate to LoginScreen
    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(30.0),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Lobster',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter the 6-digit code we just sent you via Email",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        numberOfFields,
                        (index) => SizedBox(
                          height: 68,
                          width: 54,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1 && index < numberOfFields - 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: '0',
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900, // Set warna tulisan menjadi putih
                              fontSize: 16, // Atur ukuran tulisan sesuai kebutuhan Anda
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: controls[index],
                          ),
                        ),
                      ),
                    ),
                  ),

              const SizedBox(
                height: 25,
              ),
              Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 252, 115, 36),
                          Color.fromARGB(255, 252, 160, 36),
                        ],
                      ),
                    ),
                child: MaterialButton(
                  onPressed: verifyOtp,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        ),
      ),
    );
  }
}


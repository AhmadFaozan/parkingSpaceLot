import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceparking/app/modules/login/views/login_view.dart';

import '../../../routes/app_pages.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(220, 218, 226, 236),
              Color.fromARGB(220, 228, 227, 227),
              Color.fromARGB(220, 218, 226, 236),
              Color.fromARGB(220, 157, 197, 247),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/jukir.png',
                width: 240,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "OBJECT DETECTION\nSPACE PARKING",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Never a better time than now to start.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 44,
              ),
              Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 252, 115, 36),
                          Color.fromARGB(255, 252, 160, 36),
                        ],
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Get Started",
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
    );
  }
}

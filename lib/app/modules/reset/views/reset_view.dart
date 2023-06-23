import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../login/views/login_view.dart';
import '../../navbar/views/navbar_view.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({Key? key}) : super(key: key);

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Hello Again!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: '.SF Compact',
                        package: 'CupertinoIcons',
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome to forgot password\npelase fill in bellow!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: '.SF Compact',
                        package: 'CupertinoIcons',
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
              CupertinoTextField(
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Email",
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        CupertinoIcons.mail_solid,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    placeholderStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoTextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    placeholder: "Current Password",
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        CupertinoIcons.lock_circle_fill,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        CupertinoIcons.eye,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    placeholderStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoTextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    placeholder: "New Password",
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        CupertinoIcons.lock_circle_fill,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        CupertinoIcons.eye,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    placeholderStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),CupertinoTextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    placeholder: "Confirm New Password",
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        CupertinoIcons.lock_circle_fill,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        CupertinoIcons.eye,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    placeholderStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 35,
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
                        "Rseset Password",
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



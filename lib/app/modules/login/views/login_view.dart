import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spaceparking/app/modules/reset/views/reset_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key) {
    Get.lazyPut(() => LoginController());
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      "Welcome back you've\nbeen missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: '.SF Compact',
                        package: 'CupertinoIcons',
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  CupertinoTextField(
                    key: _formKey,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    placeholder: "Enter email",
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        CupertinoIcons.mail_solid,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
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
                  SizedBox(height: 15),
                  CupertinoTextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    placeholder: "Enter Password",
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
                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
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
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetScreen()),
                        );
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 31, 64, 255),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                    child: GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) {
                        return ElevatedButton(
                          onPressed: () {
                            var loginController = Get.find<LoginController>();
                            var email = emailController.text;
                            var password = passwordController.text;
                            loginController.loginUser(email, password);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Opacity(
                            opacity: 0.5,
                            child: Divider(
                              color: const Color.fromARGB(255, 109, 109, 109),
                              thickness: 0.7,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Opacity(
                            opacity: 0.5,
                            child: Divider(
                              color: const Color.fromARGB(255, 109, 109, 109),
                              thickness: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Action for Google login
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/google.svg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 35),
                      GestureDetector(
                        onTap: () {
                          // Action for Facebook login
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/apple.svg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 35),
                      GestureDetector(
                        onTap: () {
                          // Action for Apple login
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/facebook.svg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?  ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 64, 255),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(SignupScreen());
                              },
                          ),
                        ],
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
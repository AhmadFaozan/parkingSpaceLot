import 'package:get/get.dart';

import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reset/bindings/reset_binding.dart';
import '../modules/reset/views/reset_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const Welcome(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET,
      page: () => ResetScreen(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () =>  CameraScreen(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => UserScreen(),
      binding: ProfileBinding(),
    ),
  ];
}

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/screen_authentication/bindings/screen_authentication_binding.dart';
import '../modules/screen_authentication/views/screen_authentication_view.dart';
import '../modules/screen_change_password/bindings/screen_change_password_binding.dart';
import '../modules/screen_change_password/views/screen_change_password_view.dart';
import '../modules/screen_profile/bindings/screen_profile_binding.dart';
import '../modules/screen_profile/views/screen_profile_view.dart';
import '../modules/screen_signin/bindings/screen_signin_binding.dart';
import '../modules/screen_signin/views/screen_signin_view.dart';
import '../modules/screen_signup/bindings/screen_signup_binding.dart';
import '../modules/screen_signup/views/screen_signup_view.dart';
import '../modules/screen_update/bindings/screen_update_binding.dart';
import '../modules/screen_update/views/screen_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SCREEN_AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_AUTHENTICATION,
      page: () => ScreenAuthenticationView(),
      binding: ScreenAuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_SIGNUP,
      page: () => ScreenSignupView(),
      binding: ScreenSignupBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_SIGNIN,
      page: () => ScreenSigninView(),
      binding: ScreenSigninBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_PROFILE,
      page: () => ScreenProfileView(),
      binding: ScreenProfileBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_UPDATE,
      page: () => const ScreenUpdateView(),
      binding: ScreenUpdateBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_CHANGE_PASSWORD,
      page: () =>  ScreenChangePasswordView(),
      binding: ScreenChangePasswordBinding(),
    ),
  ];
}

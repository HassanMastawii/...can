import 'package:canary_app/app/home/button_navgetion_bar.dart';
import 'package:canary_app/app/welcome/auth/Login.dart';
import 'package:canary_app/core/constant/routes.dart';
import 'package:canary_app/core/middleware/mymiddleware.dart';
import 'package:canary_app/view/auth/forgetpassword/forgetpassword.dart';
import 'package:canary_app/view/auth/forgetpassword/resetpassword.dart';
import 'package:canary_app/view/auth/forgetpassword/success_resetpassword.dart';
import 'package:canary_app/view/auth/forgetpassword/verifycode.dart';
import 'package:canary_app/view/auth/signup.dart';
import 'package:canary_app/view/auth/success_signup.dart';
import 'package:canary_app/view/auth/verifycodesignup.dart';
import 'package:canary_app/view/language.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),

  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const Home()),

  //
];

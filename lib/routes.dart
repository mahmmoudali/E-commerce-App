import 'package:e_commerce/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_screen.dart';
import 'package:e_commerce/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ComlpleteProfileScreen.routeName: (context) => ComlpleteProfileScreen(),
};

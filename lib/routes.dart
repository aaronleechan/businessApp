import 'package:business_application/screens/forget_password/forget_password_screen.dart';
import 'package:business_application/screens/home/home_screen.dart';
import 'package:business_application/screens/sign_in/sign_in_screen.dart';
import 'package:business_application/screens/splash/splash_screen.dart';
import 'package:business_application/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our route will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  SignUpScreen.routeName:(context) => SignUpScreen(),
  HomeScreen.routeName:(context)=>HomeScreen(),
};

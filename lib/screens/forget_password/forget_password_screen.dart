import 'package:business_application/screens/forget_password/components/body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName="/forget_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(" Forget Password ")
      ),
      body: Body(),
    );
  }
}

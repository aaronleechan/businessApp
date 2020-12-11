import 'package:business_application/components/no_account_text.dart';
import 'package:business_application/constants.dart';
import 'package:business_application/screens/forget_password/components/forget_password.dart';
import 'package:business_application/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(" Forget Password ",style: headerTextStyle, textAlign: TextAlign.center,),
                SizedBox(height: getProportionateScreenHeight(20),),
                Text("Please enter your email and we will send \n you a link to return to your account",style: header2TextStyle, textAlign: TextAlign.center,),
                SizedBox(height: getProportionateScreenHeight(50),),
                ForgetForm(),
                SizedBox(height: getProportionateScreenHeight(30),),
                NoAccountText(),
              ],
            ),
          ),
        ),
    );
  }
}

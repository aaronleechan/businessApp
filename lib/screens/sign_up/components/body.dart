import 'package:business_application/constants.dart';
import 'package:business_application/size_config.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Column(
              children: [
                Text(
                  'CREATE AN ACCOUNT TO GET STARTED',
                  style: headerTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(30),),
                SignUpForm(),
            ],),
          ),
        ),
      ),
    );
  }
}

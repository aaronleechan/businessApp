import 'package:business_application/blocs/auth_bloc.dart';
import 'package:business_application/components/no_account_text.dart';
import 'package:business_application/components/socal_card.dart';
import 'package:business_application/constants.dart';
import 'package:business_application/screens/sign_in/components/sign_in_form.dart';
import 'package:business_application/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Welcome Back',
                  style: headerTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  'Sign in with your email and password \n or continue with social media',
                  style: header2TextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SignInForm(),
                SizedBox(height: getProportionateScreenHeight(50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press:(){

                        }
                    ),
                    SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () => authBloc.loginGoogle()
                    ),
                    SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press:(){}
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(50)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





import 'package:business_application/blocs/auth_bloc.dart';
import 'package:business_application/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text("SIGN IN"),
    );
  }
}

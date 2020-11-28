import 'package:flutter/material.dart';
import 'package:business_application/constants.dart';
import 'package:business_application/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Business",
          style: headerTextStyle,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: header2TextStyle,
        ),
        Spacer(flex: 2),
        Icon(
          Icons.store_mall_directory,
          size: getProportionateScreenHeight(300),
        ),
      ],
    );
  }




}

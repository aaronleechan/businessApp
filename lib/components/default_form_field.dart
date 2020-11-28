import 'package:business_application/components/custom_surfix_icon.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key key,
    @required this.labelTextString,
    @required this.labelHnitTextString,
    this.surffixIconString,
    this.obscureCondition = false, 
    this.errors,
  }) : super(key: key);
  final String labelTextString;
  final String labelHnitTextString;
  final String surffixIconString;
  final bool obscureCondition;
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator:(value){
          if (value.isEmpty) {
            print("Error ");
          }
        },
        obscureText: obscureCondition,
        decoration: InputDecoration(
            labelText: labelTextString,
            hintText: labelHnitTextString,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: surffixIconString)));
  }
}

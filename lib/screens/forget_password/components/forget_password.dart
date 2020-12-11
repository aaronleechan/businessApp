import 'package:business_application/components/custom_surfix_icon.dart';
import 'package:business_application/components/default_button.dart';
import 'package:business_application/components/form_error.dart';
import 'package:business_application/constants.dart';
import 'package:business_application/size_config.dart';
import 'package:flutter/material.dart';


class ForgetForm extends StatefulWidget {
  @override
  _ForgetFormState createState() => _ForgetFormState();
}

class _ForgetFormState extends State<ForgetForm> {
  String email;
  final List<String> errors = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight*0.04),
                Center(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (newValue) => email = newValue,
                    onChanged: (value){
                      if(value.isNotEmpty && errors.contains(kEmailNullError)){
                        setState(() {
                          errors.remove(kEmailNullError);
                        });
                      }else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
                        setState(() {
                          errors.remove(kInvalidEmailError);
                        });
                      }
                      return null;
                    },
                    validator:(value){
                      if(value.isEmpty){
                        addError(error: kEmailNullError);
                      }else if(!emailValidatorRegExp.hasMatch(value)){
                        addError(error: kInvalidEmailError);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg",)
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),
                FormError(errors: errors),
                DefaultButton(
                  text: "Continue",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                    if(errors.isEmpty){
                      //Send Email Notification **********************************
                      print({"email ": email});
                    }
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }
}

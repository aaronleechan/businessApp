import 'package:business_application/components/custom_surfix_icon.dart';
import 'package:business_application/components/default_button.dart';
import 'package:business_application/components/form_error.dart';
import 'package:business_application/constants.dart';
import 'package:business_application/screens/forget_password/forget_password_screen.dart';
import 'package:business_application/screens/home/home_screen.dart';
import 'package:business_application/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(value: remember, onChanged: (value){
                setState((){
                  remember = value;
                });
              }),
              Text("Remember me"),
              Spacer(),
              InkWell(
                child: Text("Forget Password",style: TextStyle(decoration: TextDecoration.underline)),
                onTap:(){
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
                if(errors.isEmpty){
                  try{
                    final user = await _auth..signInWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }else{
                      print("Fail to Log IN");
                    }
                  }catch(e){
                    print({"Error to Log IN ": e });
                  }
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              }),
        ],
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password ',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          //value is not Empty or contains Value, Remove it
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(() {
              errors.remove(kEmailNullError);
            }); //if input value matched with rule and contains value, Remove it
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.remove(kInvalidEmailError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            // value is Empty , add Error
            addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            //value doesn't match with rule of value, add Error
            addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")));
  }
}

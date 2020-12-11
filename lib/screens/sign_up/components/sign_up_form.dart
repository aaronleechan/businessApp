import 'package:business_application/components/custom_surfix_icon.dart';
import 'package:business_application/components/default_button.dart';
import 'package:business_application/components/form_error.dart';
import 'package:business_application/constants.dart';
import 'package:business_application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  String _username;
  String _email;
  String _password;
  String _verifyPassword;
  final List<String> _errors = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          _buildUserName(),
          SizedBox(height: getProportionateScreenHeight(20)),
          _buildEmail(),
          SizedBox(height: getProportionateScreenHeight(20)),
          _buildPassword(),
          SizedBox(height: getProportionateScreenHeight(20)),
          _buildVerifyPassword(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: _errors),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }else{
                  print(_errors);
                }
                if(_password != _verifyPassword){
                 addError(error: kPasswordNotMatchError);
                }else if(_password == _verifyPassword){
                  setState(() {
                    _errors.remove(kPasswordNotMatchError);
                  });
                }
                if(_errors.isEmpty){
                  //Submit the SIGN UP Form ********************************************
                  print({"username": _username});
                  print({"email ": _email});
                  print({"password ": _password});
                  print({" verify password": _verifyPassword});
                }
              }),
        ],
      ),
    );
  }

  void addError({String error}) {
    if (!_errors.contains(error)) {
      setState(() {
        _errors.add(error);
      });
    }
  }

  Widget _buildUserName(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          addError(error: kRequiredUserUserError);
          return;
        }
        return null;
      },
      onSaved: (String value){
        _username = value;
      },
      onChanged: (value)=>{
        if(value.isNotEmpty){
          _errors.remove(kRequiredUserUserError)
        }
      },
      decoration: InputDecoration(
          labelText: "User Name",
          hintText: "Enter User Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          //value doesn't match with rule of value, add Error
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      onSaved: (String value){
        _email = value;
      },
      onChanged: (value) {
        //value is not Empty or contains Value, Remove it
        if (value.isNotEmpty && _errors.contains(kEmailNullError)) {
          setState(() {
            _errors.remove(kEmailNullError);
          }); //if input value matched with rule and contains value, Remove it
        } else if (emailValidatorRegExp.hasMatch(value) &&
            _errors.contains(kInvalidEmailError)) {
          setState(() {
            _errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "User Email",
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          addError(error: kPassNullError);
          return;
        }
        return null;
      },
      onSaved: (String value){
        _password = value;
      },
      onChanged: (value) {
        if (value.isNotEmpty && _errors.contains(kPassNullError)) {
          setState(() {
            _errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && _errors.contains(kShortPassError)) {
          setState(() {
            _errors.remove(kShortPassError);
          });
        }
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  Widget _buildVerifyPassword(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          addError(error: kPassNullError);
          return;
        }
        return null;
      },
      onSaved: (String value){
        _verifyPassword = value;
      },
      onChanged: (value) {
        if (value.isNotEmpty && _errors.contains(kPassNullError)) {
          setState(() {
            _errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && _errors.contains(kShortPassError)) {
          setState(() {
            _errors.remove(kShortPassError);
          });
        }
      },
      decoration: InputDecoration(
        labelText: "Verify Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }


}

import 'package:e_commerce/Components/custom_suffix_icon.dart';
import 'package:e_commerce/Components/default_button.dart';
import 'package:e_commerce/Components/form_error.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password;
  bool remember = false;
  bool flage = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(
                'Remember me',
                style: TextStyle(color: kTextColor),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  });
                },
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                      color: kTextColor, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
              if (flage == true)
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            },
            text: 'Continue',
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
            flage = true;
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
            flage = true;
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
            flage = false;
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
            flage = false;
          });
          return "";
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: 'Enter your password',
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        labelText: 'Password',
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
            flage = true;
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
            flage = true;
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
            flage = false;
            return "";
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
            flage = false;
            return "";
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: 'Enter your email',
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
        labelText: 'Email',
      ),
    );
  }
}

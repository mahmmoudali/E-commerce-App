import 'package:e_commerce/Components/custom_suffix_icon.dart';
import 'package:e_commerce/Components/default_button.dart';
import 'package:e_commerce/Components/form_error.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final form_key = GlobalKey<FormState>();

  final List<String> errors = [];

  String email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form_key,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          width: double.infinity,
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildConfimPasswordFormField(),
              SizedBox(height: getProportionateScreenHeight(5)),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(5)),
              DefaultButton(
                text: 'Continue',
                press: () {
                  if (form_key.currentState.validate()) {
                    form_key.currentState.save();
                    // Navigator.pushNamed(
                    //     context, ComlpleteProfileScreen.routeName);

                  }
                },
              ),
            ],
          ),
        ));
  }

  TextFormField buildConfimPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value && !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
            return "";
          });
        }
        confirmPassword = value;
        return null;
      },
      onChanged: (value) {
        if (password == confirmPassword && errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        confirmPassword = value;
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Re-enter your password',
          labelText: 'Confirm Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg')),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
            return "";
          });
        }
        password = value;
        return null;
      },
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
        password = value;
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Enter your password',
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg')),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
            return "";
          });
        } else if (value.isNotEmpty &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
            return "";
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Enter your email',
          labelText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg')),
    );
  }
}

import 'package:e_commerce/screens/forgot_password/components/forgot_password_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(30)),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  "Please enter your email and we will send \nyou a link to return to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                ForgotPasswordForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kPrimaryColor),
                    ),
                    SizedBox(height: getProportionateScreenHeight(200)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

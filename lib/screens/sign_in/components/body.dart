import 'package:e_commerce/Components/social_card.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/login_success/login_success_screen.dart';
import 'package:e_commerce/screens/sign_in/components/sign_form.dart';
import 'package:e_commerce/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

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
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(30)),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  'Sign in with your e-mail and password\nor continue with soical media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kPrimaryColor),
                      ),
                    ),
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

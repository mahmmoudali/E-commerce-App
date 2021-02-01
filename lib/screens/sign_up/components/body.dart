import 'package:e_commerce/Components/social_card.dart';

import 'package:e_commerce/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Register Account',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(28)),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Text(
            'Complete your details or continue \nwith social media',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          SignUpForm(),
          SizedBox(height: getProportionateScreenHeight(100)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SocialCard(icon: 'assets/icons/google-icon.svg'),
            SocialCard(icon: 'assets/icons/facebook-2.svg'),
            SocialCard(icon: 'assets/icons/twitter.svg'),
          ]),
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
              'By Continuing your confirm that means you \nagree with our terms and conditions ',
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

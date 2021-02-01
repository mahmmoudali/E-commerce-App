import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.imgUrl,
    this.mainText,
  }) : super(key: key);

  final String mainText, text, imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Text(
          '$mainText',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(36),
          ),
        ),
        Text(
          '$text',
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        Image.asset(
          '$imgUrl',
          height: getProportionateScreenHeight(400),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}

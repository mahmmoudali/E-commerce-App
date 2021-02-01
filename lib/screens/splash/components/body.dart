import 'package:e_commerce/Components/default_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/screens/splash/components/splash_content.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      'text': "Welcome to Tokoto , Let's shop",
      'imgUrl': 'assets/images/splash_1.png'
    },
    {
      'text':
          "We help people connect with store arround \nUnited State of America",
      'imgUrl': 'assets/images/splash_2.png'
    },
    {
      'text': "We show the easy way to shop. \nJust stay at home with us",
      'imgUrl': 'assets/images/splash_3.png'
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  imgUrl: splashData[index]['imgUrl'],
                  text: splashData[index]['text'],
                  mainText: 'TOKOTO',
                ),
              ),
            ),
            // SizedBox(
            //   height: getProportionateScreenHeight(5),
            // ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: 'Continue',
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(flex: 2)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

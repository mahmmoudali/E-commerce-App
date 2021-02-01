import 'package:e_commerce/Components/default_button.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Login Success'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'assets/images/success.png',
                height: SizeConfig.screenHeight * 0.40,
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              Text(
                'Login Sucess',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(38)),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(70)),
                child: DefaultButton(
                  text: 'Back to home',
                  press: () {
                    Navigator.popAndPushNamed(context, SplashScreen.routeName);
                  },
                ),
              ),
              Spacer()
            ],
          ),
        ));
  }
}

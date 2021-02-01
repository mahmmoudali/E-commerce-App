import 'package:e_commerce/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/sign_in';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in'), centerTitle: true),
      body: Body(),
    );
  }
}

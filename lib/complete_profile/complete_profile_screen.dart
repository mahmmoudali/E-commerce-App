import 'package:flutter/material.dart';

class ComlpleteProfileScreen extends StatefulWidget {
  static String routeName = '/complete_profile';
  @override
  _ComlpleteProfileScreenState createState() => _ComlpleteProfileScreenState();
}

class _ComlpleteProfileScreenState extends State<ComlpleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
    );
  }
}

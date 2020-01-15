import 'package:banking_app/views/LoginScreen.dart';
import 'package:flutter/material.dart';

//our app
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Login',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}
void main() => runApp(MyApp());
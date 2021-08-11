import 'package:flutter/material.dart';
import 'package:pizzeria/screen/home.dart';
import 'package:pizzeria/screen/order.dart';
import 'package:pizzeria/screen/review.dart';
import 'package:pizzeria/screen/login_page.dart';
import 'package:pizzeria/screen/signup.dart';

void main() => runApp(new MyApp());

String username='';
String email = '';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder> {
        '/Home': (BuildContext context) => new Home(username: username,email: email,),
        '/Order': (BuildContext context) => new Order(username: username,email: email,),
        '/Review': (BuildContext context) => new Review(),
        '/SignUp': (BuildContext context) => new SignUp(),
        '/LogIn': (BuildContext context) => new HomePage(),
      },
      home: new HomePage(),
    );
  }
}
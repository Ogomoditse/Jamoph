import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {

  @override
  SignUpPageState createState() => new SignUpPageState();

}

class SignUpPageState extends State<SignUp>{

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email    = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController verPassword = new TextEditingController();

  void addData(){
    var url="http://10.0.2.2/Pizzeria/addData.php";

    http.post(url, body: {

      "firstname": firstName.text,
      "lastname": lastName.text,
      "email" : email.text,
      "password": password.text,
    });

  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: Text("SignUp"),),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[

                  Text("Firstname",style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller: firstName,
                    decoration: InputDecoration(
                      hintText: "Enter First Name"
                    ),
                  ),

                  Text("Lastname",style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller: lastName,
                    decoration: InputDecoration(
                        hintText: "Enter Last Name"
                    ),
                  ),

                  Text("Email", style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Enter email"
                    ),
                  ),

                  Text("password", style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: "Enter password"
                    ),
                  ),

                  Text("verPassword", style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller: verPassword,
                    decoration: InputDecoration(
                        hintText: "re-enter password"
                    ),
                  ),

                  RaisedButton(
                    child: Text("SingUp"),
                    onPressed: () {
                      addData();
                    },
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
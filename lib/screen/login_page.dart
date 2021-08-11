import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pizzeria/main.dart';
import 'package:pizzeria/screen/signup.dart';


class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  TextEditingController user= new TextEditingController();
  TextEditingController pass= new TextEditingController();

  String banner = '';
  Future<List> _login() async{

    final response = await http.post("http://10.0.0.2/Pizzeria/getData.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    print("object");
    print(response.body);

    var Details = json.decode(response.body);

    String email1 = Details[0]['Email'];
    String username1 = Details[0]['Firstname'];

   print (email1);
   print (username1);


    if((response.body).length==2){

      setState(() {

        banner = "Invalid username of password";
        user.clear();
        pass.clear();


      });
    }else{

      user.clear();
      pass.clear();
      Navigator.pushReplacementNamed(context, '/Home');

      setState(() {

        username = username1;
        email = email1;

      });
    }


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: user,
                decoration: InputDecoration(
                  hintText: 'Username'
                ),
              ),

              Text("password",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password'
                ),
              ),
              RaisedButton(
                child: Text("login"),
                onPressed: (){
                  _login();
                },
              ),

              RaisedButton(
                child: Text("SignUp"),
                onPressed: (){
                  Navigator.of(context).pushNamed('/SignUp');
                }
              ),

              Text(banner, style:TextStyle(fontSize: 20.0),),
            ],
          ),
        )
      ),


    );
  }

}
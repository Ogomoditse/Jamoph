import 'package:flutter/material.dart';
import 'package:pizzeria/screen/order.dart';

class Home extends StatelessWidget {

  Home({this.username,this.email});
  final String username;
  final String email;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(title: new Text('welcom $username'),),
      body: new Center(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Image.asset('images/pizza.jpg'),
              new RaisedButton(
                child: new Text('Order'),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new Order(username: username, email: email,),
                  );
                  Navigator.of(context).push(route);

                }

              ),

              new RaisedButton(
                  child: new Text('Log Out'),
                  onPressed: (){Navigator.of(context).pushNamed('/LogIn');}

              ),

            ]

          )
        ),
      ),
    );
  }

}
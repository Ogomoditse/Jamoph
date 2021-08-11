

import 'package:flutter/material.dart';
import 'package:pizzeria/screen/review.dart';
import 'package:pizzeria/code/pizza.dart';
import 'package:http/http.dart' as http;


class Order extends StatefulWidget {

  final String username;
  final String email;

  Order({Key key,this.email,this.username}): super (key: key);


  @override
  _State createState() => new _State();
}

class _State extends State<Order> {


  pizza _pizzaOrder = new pizza();

  void _setSize(String value) {

    setState((){
      _pizzaOrder.size = value;
    });
  }

  void _setShape(String value){

    setState(() {
      _pizzaOrder.shape=value;
    });

  }

  void _setCrest(String value){

    setState(() {
      _pizzaOrder.crust=value;
    });

  }

  void _setTopping(int index, bool value) {

    setState(() {
      String key = _pizzaOrder.toppings.keys.elementAt(index);
      _pizzaOrder.toppings[key] = value;
    });
  }

  void OrderPizza() async{

    var url="http://10.0.2.2/Pizzeria/addPizza.php";
    final response = await http.post(url, body: {

      "email" : widget.email,
      "size": _pizzaOrder.size,
      "shape": _pizzaOrder.shape,
      "crest": _pizzaOrder.crust,
      "Chicken": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(0)].toString(),
      "Onion": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(1)].toString(),
      "Beef": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(2)].toString(),
      "Macon": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(3)].toString(),
      "Pineapple": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(4)].toString(),
      "Mushroom": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(5)].toString(),
      "Pepperoni": _pizzaOrder.toppings[_pizzaOrder.toppings.keys.elementAt(6)].toString(),

    });

    String key = _pizzaOrder.toppings.keys.elementAt(0);
    bool a = _pizzaOrder.toppings[key];

    String key2 = _pizzaOrder.toppings.keys.elementAt(1);
    bool a2 = _pizzaOrder.toppings[key2];

    print(key);
    print(a);
    print(key2);
    print(a2);
    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(title: new Text('Order Pizza ${widget.username}'),),
      body: new Center(
        child: new Container(

          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new DropdownButton<String>(


                value: _pizzaOrder.size,
                items: pizza.sizes.map((String value) {
                  return new DropdownMenuItem(
                      value: value,
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.local_pizza),
                          new Text('Size:  $value'),
                        ]
                      )
                  );
                }) .toList(),

                onChanged: (String value){_setSize(value);}
              ),
 
              new DropdownButton<String>(

                  value: _pizzaOrder.shape,
                  items: pizza.shapes.map((String value) {
                    return new DropdownMenuItem(
                        value: value,
                        child: new Row(
                            children: <Widget>[
                              new Icon(Icons.local_pizza),
                              new Text('Shape:  $value'),
                            ]
                        )
                    );
                  }) .toList(),

                  onChanged: (String value){_setShape(value);}
              ),

              new DropdownButton<String>(

                  value: _pizzaOrder.crust,
                  items: pizza.crest.map((String value) {
                    return new DropdownMenuItem(
                        value: value,
                        child: new Row(
                            children: <Widget>[
                              new Icon(Icons.local_pizza),
                              new Text('Crest:  $value'),
                            ]
                        )
                    );
                  }) .toList(),

                  onChanged: (String value){_setCrest(value);}
              ),

              new Text(""),
              new Text(""),
              new Text("ADDITIONAL ITEMS"),

              new Expanded(


                  child: new ListView.builder(
                    
                    itemCount: _pizzaOrder.toppings.length,
                    shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                      return new CheckboxListTile(
                          
                          controlAffinity: ListTileControlAffinity.leading,
                          title: new Text(_pizzaOrder.toppings.keys.elementAt(index)),
                          value: _pizzaOrder.toppings.values.elementAt(index), 
                          onChanged: (bool value){_setTopping(index, value);});
                      }

                  )
              ),

              new RaisedButton(
                  child: new Text("Continue"),
                  onPressed: (){
                    OrderPizza();
                    //Navigator.pushReplacementNamed(_pizzaOrder, '/Review');
                  })

            ],

          ),
        ),

    )
    );
  }
}
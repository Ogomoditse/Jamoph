import 'package:flutter/material.dart';
import 'package:pizzeria/code/pizza.dart';

class Review extends StatelessWidget {

  pizza _pizzaOrder;
  List<String> _list = new List<String>();


  Review({order: null}) {

  _list.add("Size:  ${_pizzaOrder.size}");
  _list.add("Shape:  ${_pizzaOrder.shape}");
  _list.add("Crest:  ${_pizzaOrder.crust}");
  _list.add(" ");
  _list.add("Toppings: ");

  _pizzaOrder.toppings.forEach((String name, bool data){

  if(data) _list.add(name);
  });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Review Pizza Order'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text("Review you order", style: new TextStyle(fontWeight:  FontWeight.bold),),
            new Expanded(
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index){

                  return new Text(_list.elementAt(index));
                },
              )
            )
          ]
        ),
      ),

    );
  }


}


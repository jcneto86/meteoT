import 'package:flutter/material.dart';

class MeteoT extends StatefulWidget {
  MeteoT({Key key}) : super(key: key);

  @override
  _MeteoTState createState() => _MeteoTState();
}

class _MeteoTState extends State<MeteoT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MétéoT'),
        backgroundColor: Colors.pinkAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/1406.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Olá Québec!"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 90.0,
            child: Image.asset("assets/icons/rain.png"),
          ),
        ],
      ),
    );
  }
}

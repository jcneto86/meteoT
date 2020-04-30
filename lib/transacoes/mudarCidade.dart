import 'package:flutter/material.dart';

class MudarCidade extends StatelessWidget {
  var _cidadeFildControl = new TextEditingController();
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mudar Cidade"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/805.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Cidade",
                  ),
                  controller: _cidadeFildControl,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {"cidade": _cidadeFildControl.text});
                  },
                  textColor: Colors.white60,
                  color: Colors.pinkAccent,
                  child: Text("Mostrar clima"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

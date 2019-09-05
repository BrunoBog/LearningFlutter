import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MudarCidade extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var _cidadeCampoControl= new TextEditingController();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Mudar cidade"),
            centerTitle: true,        
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Center(
                child: Image.asset(
                    "assets/rannyday.jpg",
                    width: double.infinity, 
                    height: double.infinity,
                    fit: BoxFit.cover,
                 ),
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    title: TextField(
                      decoration: InputDecoration(hintText: "Cidade"),
                      controller: _cidadeCampoControl= new TextEditingController(),
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed:  () {
                    Navigator.pop(context, {
                      'cidade': _cidadeCampoControl.text
                    });
                  },
                  textColor: Colors.white70,
                  color: Colors.redAccent,
                  child: Text("Mostra o tempo"),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
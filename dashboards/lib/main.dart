import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _clients = await getClients();
  for (int i = 0; i < _clients.length; i++) {
    debugPrint(" ${_clients[i]}");
  }

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: AppBar(
        title: Text("Clientes",
        style: TextStyle(color: Colors.orangeAccent),),
        backgroundColor: Colors.black,
      ),
      body: new Center(
        child: Row(
          children: <Widget>[
            Image.asset(
                    "assets/User.png",
                    width: 122.0,
                     height: 122.0,
                     color: Colors.black,
                  ),
            Text("nome do caboclo",
            style: TextStyle(
              color: Colors.orange
            ),),
          ],
        ),
      ),
    ),
  ));
}

Future<List> getClients() async {

  String url = 'https://knewinsocialclientesinsights.azurewebsites.net/Clientes';
  //"https://knewinsocialclientes20190603103537.azurewebsites.net/"

    http.Response response = await http.get(url);
    //status code == 200 = OK
    if (response.statusCode == 200) {
      //print(json.encode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception('Falhou!');
    }

}

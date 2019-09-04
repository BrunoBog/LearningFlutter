import 'package:flutter/material.dart';

class Klimatico extends StatefulWidget {
  @override
  _KlimaticoState createState() => _KlimaticoState();
}

class _KlimaticoState extends State<Klimatico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klimatico'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => null,
          )
        ],
        ),
        body: Stack(
          children: <Widget>[
            Center(child: Image.asset('assets/sunnyDay.png',
             width: double.infinity,
             height: double.infinity,
             fit: BoxFit.fill
             ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Opa Floripa")  
                ],
              ),
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/iconuvem.png"),
                width: 200,
                height: 200,
              )
          ],),
    );
  }
}
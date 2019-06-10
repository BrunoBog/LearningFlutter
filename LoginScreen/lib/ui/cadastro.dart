import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _loginontroller = new TextEditingController();
  final _passwordController  = new TextEditingController();
  String wellcome;

  void _showWellcome(){
    if (_loginontroller.text.isNotEmpty){
      wellcome = "Ola ${_loginontroller.text}";
      debugPrint(wellcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/userlogin.png",
              width: 90.0,
              height: 90.0,
              color: Colors.black,
            ),
            Container(
              width: double.infinity,
              // color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _loginontroller,
                      decoration: InputDecoration(
                          hintText: 'User',
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(4.5)),
                          icon: Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(4.5)),
                          icon: Icon(Icons.lock)),
                    ),
                  ),
                  //buttons
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          // margin: const EdgeInsets.only(left: 80.0),
                          child: RaisedButton(
                            onPressed: () => null,
                            color: Colors.blueAccent,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.9),
                            ),
                          ),
                        ),
                        Container(
                          // margin: const EdgeInsets.only(left: 38.0), foi substituido pelo mainAxisAlignment
                          child: RaisedButton(
                            onPressed: () => _showWellcome,
                            color: Colors.white,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 20.9),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/vovojuju.png",
                    width: 122.0,
                     height: 122.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:clima/transacoes/pega_clima.dart';
import 'package:flutter/material.dart';
import 'package:clima/util/util.dart' as util;

import 'mudarCidade.dart';
class Klimatico extends StatefulWidget {
  @override
  _KlimaticoState createState() => _KlimaticoState();
}

class _KlimaticoState extends State<Klimatico> {
  String _cidadeEscolhida;

  Future _abrirNovaTela(BuildContext context) async{
    Map resultado = await 
      Navigator
        .of(context)
        .push(new MaterialPageRoute<Map>( builder: (BuildContext context){
            return new MudarCidade();
      }));

    if(resultado != null && resultado.containsKey('cidade')){
      _cidadeEscolhida = resultado['cidade'];
    }
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klimatico'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _abrirNovaTela(context),
          )
        ],
        ),
        body: Stack(
          children: <Widget>[
            Center(child: Image.asset('assets/rannyday.jpg',
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
                  Text("Opa $_cidadeEscolhida")  
                ],
              ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset("assets/nuvem.png", width: 150, height: 150,)
                ]
                )
              ),
              atualizartempWidget(_cidadeEscolhida)
          ],),
    );
  }

  Widget atualizartempWidget(String cidade){
    return FutureBuilder(
      future: pegaClima( util.appID, cidade == null? util.minhaCidade: cidade),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      if(snapshot.hasData){
        Map conteudo = snapshot.data;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text(_cidadeEscolhida,style: TextStyle(color: Colors.limeAccent, fontSize: 40),),
                subtitle: ListTile(
                  title: Text(conteudo['main']['temp'].toString() + '°f', 
                  style: TextStyle(color: Colors.white70),
                  ),
                )
              )
            ]
          )
        );
      }
      else{
        return Container(
          child: Text("Erouuuuuu"),
        );
      }
    }
    ) ; 
  }
}


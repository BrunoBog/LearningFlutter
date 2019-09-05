import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> pegaClima(String appID, String cidade) async {
  if (cidade == null) {
    cidade = 'washington';
  }
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=$cidade,uk&APPID=$appID";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }else{
      throw Exception("Deu ruim ao chamar a API");

    }
  
}

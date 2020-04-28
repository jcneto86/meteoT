import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> getClima(String appID, String cidade) async {
  String apiURL =
      "api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$appID";
  http.Response response = await http.get(apiURL);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception("Falhou!");
  }
}

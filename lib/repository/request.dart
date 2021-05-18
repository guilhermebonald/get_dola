import 'dart:convert';
import 'package:dolaNow/model/chart_model/d_chart_model.dart';
import 'package:dolaNow/model/dolar_model_g.dart';
import 'package:http/http.dart' as http;

class RequestData {
  Future getApi() async {
    var url = Uri.https('economia.awesomeapi.com.br', '/json/all');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      // return DolarApiModel.fromJson(
      //   jsonDecode(response.body),
      // );
      var data = jsonDecode(response.body);
      var dados = DolarApiModel.fromJson(data);
      return dados;
    } else {
      print('Error in request!');
    }
  }

  Future getListApi() async {
    final response = await http
        .get('https://economia.awesomeapi.com.br/json/daily/USD-BRL/10');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //Os dados vindo da Api são uma lista.
      //Estou dizendo que data é uma lista e convertendo em um map, e Transforma em uma lista no UserModel.
      var users = (data as List).map((value) {
        return UserModel.fromJson(value);
      }).toList();
      return users;
    } else {
      print("Error in URL");
    }
  }
}

// users = (data"Decode" as List).map((json) {
//         return FortniteModel.fromJson(json);
//       }).toList();
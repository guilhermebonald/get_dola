import "package:http/http.dart" as http;
import 'dart:convert';
import 'd_chart_model.dart';

class NetworkService {
  //Criei uma Lista de UserModel (users).
  List<UserModel> users = List();

  Future getUsers() async {
    final response = await http.get('https://economia.awesomeapi.com.br/json/daily/USD-BRL/10');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //Estou dizendo que data é uma lista e convertendo em um map, e Transforma em uma lista no UserModel.
      users = (data as List).map((json) {
        return UserModel.fromJson(json);
      }).toList();
      return users;
    } else {
      print("Error in URL");
    }
  }
}

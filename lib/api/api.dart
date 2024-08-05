import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:users_api/models/user.dart';

class Api {
  Future<List<User>> getUsers() async {
    const String url = "https://jsonplaceholder.typicode.com/users";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

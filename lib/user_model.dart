import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:waleed_clean_arch_1/user_json.dart';
class UserModel {
  Future<List<UserJson>> getUsers() async{
    List<UserJson> users = [];
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    debugPrint('Response Status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    for(var element in json.decode(response.body) as List){
      users.add(UserJson.fromJson(element));
    }

    return users;
  }
}
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:waleed_clean_arch_1/user_json.dart';

import 'entities/user_domain.dart';
class UserModel {

  Future<List<UserDomain>> getUsers() async{
    List<UserJson> users = [];
    List<UserDomain> userDomains = [];
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    debugPrint('Response Status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    return (json.decode(response.body) as List).map((e) => UserJson.fromJson(e).toDomain()).toList();
  }
}
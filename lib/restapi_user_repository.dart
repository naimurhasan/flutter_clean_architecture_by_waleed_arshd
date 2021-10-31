import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:waleed_clean_arch_1/abstractions/user_repository.dart';
import 'package:waleed_clean_arch_1/entities/user_domain.dart';
import 'package:waleed_clean_arch_1/user_json.dart';
import 'package:http/http.dart' as http;

class RestApiUserRepository implements UserRepository{

  @override
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
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waleed_clean_arch_1/entities/user_domain.dart';
import 'package:waleed_clean_arch_1/user_json.dart';
import 'package:waleed_clean_arch_1/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel userModel = UserModel();
  List<UserDomain> users = [];

  fetchUser() async{
    users = await userModel.getUsers();
    setState(() {});
  }


  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, i){
        return Card(child: ListTile(
          title: Text('${users[i].name}'),
          subtitle: Text('${users[i].email}'),
        ));
      }),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

import 'package:flutter/material.dart';
import 'package:waleed_clean_arch_1/abstractions/user_repository.dart';
import 'package:waleed_clean_arch_1/entities/user_domain.dart';
import 'package:waleed_clean_arch_1/restapi_user_repository.dart';




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
      home: MyHomePage(title: 'Flutter Demo Home Page', userRepository: RestApiUserRepository(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title,required this.userRepository}) : super(key: key);

  final String title;
  final UserRepository userRepository;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserRepository userRepository;
  List<UserDomain> users = [];

  fetchUser() async{
    userRepository = widget.userRepository;
    users = await userRepository.getUsers();
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

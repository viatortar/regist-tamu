import 'package:flutter/material.dart';
import 'package:tamuapp/helpers/user_info.dart';
import 'package:tamuapp/ui/login_page.dart';
import 'package:tamuapp/ui/tamu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = TamuPage();
      });
    } else {
      setState(() {
        page = LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lowongan KERJA',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

import 'package:firebase_auth_login/data/join_or_login.dart';
import 'package:firebase_auth_login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>.value(
        value: JoinOrLogin(), // Create JoinOrLogin
          child: AuthPage() // Now JoinOrLogin Status is accessible inside AuthPage.
      ),
    );
  }
}

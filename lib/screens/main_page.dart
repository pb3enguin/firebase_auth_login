import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String? email;

  MainPage(this.email);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: email == null? Text('Email') : Text(email!)
      ),
      body: Container(
        child: Center(
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}

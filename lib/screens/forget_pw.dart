import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../id_pass_validation.dart';

class ForgetPw extends StatefulWidget {
  const ForgetPw({Key? key}) : super(key: key);

  @override
  _ForgetPwState createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password')
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: "Email",
            -  ),
              validator: (value) {
                if (isEmailValid(value!)) {
                  return "Please input correct Email.";
                }
                return null;
              },
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);

                final snackBar = SnackBar(content: Text('Check you email for password reset.'),);
                ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(snackBar);
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

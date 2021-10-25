import 'package:firebase_auth_login/data/join_or_login.dart';
import 'package:firebase_auth_login/helper/login_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../id_pass_validation.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          size: size,
          painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _logoImage(size),
            Stack(children: <Widget>[_inputForm(size), _authButton(size)]),
            Container(
              height: size.height * 0.10,
            ),
            Consumer<JoinOrLogin>(
              builder: (context, joinOrLogin, child) =>
                  GestureDetector(
                      onTap: (){
                        joinOrLogin.toggle();
                      },
                      child: Text(joinOrLogin.isJoin? "Already Have an Account? Sign in" : "Don't Have an Account? Create One",
                        style: TextStyle(color: joinOrLogin.isJoin? Colors.red : Colors.blue),)
                  ),
            ),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ],
    ));
  }

  Widget _logoImage(Size size) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.05, left: 24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/250")),
        ),
      ),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.2,
      right: size.width * 0.2,
      bottom: 0,
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            if(_formKey.currentState!.validate()){
              print(_emailController.text.toString());
            }
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 20, color: Colors.white)),
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: Text("Login"),
        ),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (isEmailValid(value!)) {
                        return "Please inpour correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (isPasswordValid(value!)) {
                        return "Please inpour correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }
}

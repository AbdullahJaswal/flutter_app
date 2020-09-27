import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:sample/home/page_3.dart';
import 'package:sample/home/sign_up.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Please enter an Email Address.";
                        } else
                          return null;
                      },
                      onSaved: (input) => _email = input,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          color: Colors.deepPurpleAccent,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                          color: Colors.deepPurpleAccent,
                        )),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                        )),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (input) {
                        if (input.length < 6) {
                          return "Please enter a Password of at least 6 characters.";
                        } else
                          return null;
                      },
                      onSaved: (input) => _password = input,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.deepPurpleAccent,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                          color: Colors.deepPurpleAccent,
                        )),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                        )),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onPressed: signIn,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      color: Colors.deepPurpleAccent,
                      textColor: Colors.grey.shade900,
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onPressed: signUp,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      color: Colors.deepPurpleAccent,
                      textColor: Colors.grey.shade900,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (_loading == true)
            Container(
              width: 200.0,
              height: 200.0,
              child: FlareActor(
                "assets/svgs/animation_1.flr",
                animation: "circular",
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            )
        ],
      ),
    );
  }

  Future<void> signIn() async {
    final _formState = _formKey.currentState;

    if (_formState.validate()) {
      _formState.save();
      try {
        setState(() {
          _loading = true;
        });
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        _loading = false;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Page3(user: user)));
      } catch (e) {
        throw new AuthException(e.code, e.message);
      }
    }
  }

  void signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(),
        fullscreenDialog: true,
      ),
    );
  }
}

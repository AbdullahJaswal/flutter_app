import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

StreamBuilder body2(FirebaseUser user) {
  return StreamBuilder<DocumentSnapshot>(
    stream:
        Firestore.instance.collection('users').document(user.uid).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Error: ${snapshot.error}",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Loading...",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        default:
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Name: ",
                      textAlign: TextAlign.center,
                      style: greyText(),
                    ),
                    Text(
                      snapshot.data["name"],
                      textAlign: TextAlign.center,
                      style: redText(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Age: ",
                      textAlign: TextAlign.center,
                      style: greyText(),
                    ),
                    Text(
                      snapshot.data["age"],
                      textAlign: TextAlign.center,
                      style: redText(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Country: ",
                      textAlign: TextAlign.center,
                      style: greyText(),
                    ),
                    Text(
                      snapshot.data["country"],
                      textAlign: TextAlign.center,
                      style: redText(),
                    ),
                  ],
                ),
              ],
            ),
          );
      }
    },
  );
}

TextStyle greyText() {
  return TextStyle(
    color: Colors.grey,
  );
}

TextStyle redText() {
  return TextStyle(
    color: Colors.redAccent,
  );
}

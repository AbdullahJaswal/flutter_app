import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade900,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.purple.shade900,
                    Colors.deepPurpleAccent.shade700,
                  ]),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10.0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.person, size: 80.0),
                        ),
                      ),
                      Text(
                        "Profile 1",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                )),
            CustomListTile(Icons.person, "Profile", () => {}),
            CustomListTile(Icons.notifications, "Notifications", () => {}),
            CustomListTile(Icons.settings, "Settings", () => {}),
            CustomListTile(Icons.lock, "Log Out", () => {}),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.deepPurpleAccent),
          ),
        ),
        child: Material(
          color: Colors.grey.shade900,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.deepPurpleAccent.shade200,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: Colors.deepPurpleAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

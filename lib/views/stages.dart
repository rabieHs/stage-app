import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/constants.dart';

class Stages extends StatefulWidget {
  const Stages({Key? key}) : super(key: key);

  @override
  State<Stages> createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: primaryColor,
            elevation: 0,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "mes stages",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: ListView(children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/bhbank.jpg"),
            ),
            title: Text('nom de lentreprise'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/bhbank.jpg"),
            ),
            title: Text('nom de lentreprise'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/bhbank.jpg"),
            ),
            title: Text('nom de lentreprise'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/bhbank.jpg"),
            ),
            title: Text('nom de lentreprise'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/bhbank.jpg"),
            ),
            title: Text('nom de lentreprise'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
        ]));
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stage_app/views/isg/liste_etudiants.dart';
import 'package:stage_app/views/isg/verifier_etudiants.dart';

class ISGHome extends StatefulWidget {
  const ISGHome({super.key});

  @override
  State<ISGHome> createState() => _ISGHomeState();
}

class _ISGHomeState extends State<ISGHome> {
  int index = 0;
  List interfaces = [
    ListeEtudiants(),
    VerifierEtudiants(),
    //nom interface()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 23, 205, 183),
            elevation: 0,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "espace ISG",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        drawer: Drawer(
          child: ListView(children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/logoo.png")),
                accountName: Text("ISG"),
                accountEmail: Text("isg.gmai.com")),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("liste des etudiants"),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified),
              title: const Text("verifier les etudiants"),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
          ]),
        ),
        body: interfaces[index]);
  }
}

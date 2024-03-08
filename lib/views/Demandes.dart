import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/constants.dart';

class Demandes extends StatefulWidget {
  const Demandes({Key? key}) : super(key: key);

  @override
  State<Demandes> createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 240, 125, 185),
            elevation: 0,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "mes Demandes",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: ListView(children: [
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("titre de stage"),
                      content: Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nom&Prenom:  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("ay esm",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Email: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("ay esm",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Niveau:  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("3 émé ",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Specialité:  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Informatique de gestion Informatique de gestion",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text("Refuser"),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text("Accepter"),
                            )),
                      ],
                    );
                  });
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/logoo.png"),
            ),
            title: Text('nom de letudiant'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/logoo.png"),
            ),
            title: Text('nom de letudiant'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/logoo.png"),
            ),
            title: Text('nom de letudiant'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/logoo.png"),
            ),
            title: Text('nom de letudiant'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/logoo.png"),
            ),
            title: Text('nom de letudiant'),
            subtitle: Text('email'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
        ]));
  }
}

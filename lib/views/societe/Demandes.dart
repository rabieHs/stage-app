import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/constants.dart';

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
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return GestureDetector(
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
                              Row(
                                children: [
                                  Text(
                                    "date debut:  ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("15/06/2024",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.grey))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "date fin :  ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("15/07/2024",
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
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text("Refuser"),
                              )),
                          ElevatedButton(
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
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/bhbank.jpg"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'nom de l/etudiant',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
            );
          }),
          itemCount: 5,
        ));
  }
}
 //na9sa date debut w date fin fl formulaire
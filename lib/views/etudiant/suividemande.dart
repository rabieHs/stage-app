import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/constants.dart';

class suividemande extends StatefulWidget {
  const suividemande({Key? key}) : super(key: key);

  @override
  State<suividemande> createState() => _suividemandeState();
}

class _suividemandeState extends State<suividemande> {
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
                "suivi demandes",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: Column(
          children: [
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("en cours ")
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("refusé ")
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("accepté ")
                    ],
                  )
                ],
              ),
            ),
            ListView(shrinkWrap: true, children: [
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
                                Row(
                                  children: [
                                    Text(
                                      "date debut:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("15/05/2024",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "date fin:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("15/06/2024",
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
                                  child: Text("annuler"),
                                )),
                          ],
                        );
                      });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/bhbank.jpg"),
                ),
                title: Text('nom de lentreprise'),
                subtitle: Text('email'),
                trailing: Icon(Icons.circle_rounded),
                iconColor: Colors.orange,
                minLeadingWidth: 100,
              ),
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
                                Row(
                                  children: [
                                    Text(
                                      "date debut:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("12/05/2024",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "date fin:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("12/08/2024",
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
                                  child: Text("annuler"),
                                )),
                          ],
                        );
                      });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/bhbank.jpg"),
                ),
                title: Text('nom de lentreprise'),
                subtitle: Text('email'),
                trailing: Icon(Icons.circle_rounded),
                iconColor: Colors.green,
                minLeadingWidth: 100,
              ),
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
                                Row(
                                  children: [
                                    Text(
                                      "date debut:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("01/05/2024",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "date fin:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("1/07/2024",
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
                                  child: Text("annuler"),
                                )),
                          ],
                        );
                      });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/bhbank.jpg"),
                ),
                title: Text('nom de lentreprise'),
                subtitle: Text('email'),
                trailing: Icon(Icons.circle_rounded),
                iconColor: Colors.red,
                minLeadingWidth: 100,
              ),
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
                                    Text("ghjgii@gmail.com",
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
                                    Text("14/06/2024",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "date fin:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("14/07/2024",
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
                                  child: Text("annuler"),
                                )),
                          ],
                        );
                      });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/bhbank.jpg"),
                ),
                title: Text('nom de lentreprise'),
                subtitle: Text('email'),
                trailing: Icon(Icons.circle_rounded),
                iconColor: Colors.green,
                minLeadingWidth: 100,
              ),
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
                                    Text("hjhhf@gmail.com",
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
                                    Text("12/07/2024",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "date fin:  ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("12/08/2024",
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
                                  child: Text("annuler"),
                                )),
                          ],
                        );
                      });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/bhbank.jpg"),
                ),
                title: Text('nom de lentreprise'),
                subtitle: Text('email'),
                trailing: Icon(Icons.circle_rounded),
                iconColor: Colors.orange,
                minLeadingWidth: 100,
              ),
            ]),
          ],
        ));
  }
}

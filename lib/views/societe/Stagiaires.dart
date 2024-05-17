import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:html' as html;

import '../../core/constants.dart';

class Stagiaires extends StatefulWidget {
  const Stagiaires({Key? key}) : super(key: key);

  @override
  State<Stagiaires> createState() => _StagiairesState();
}

class _StagiairesState extends State<Stagiaires> {
  Future<List<Map>> getMesStagiaires() async {
    //get societe id
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final result = await FirebaseFirestore.instance
        .collection("stagiaires")
        .where("societe_id", isEqualTo: uid)
        .get();
    return result.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: fourthColor,
            elevation: 0,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "mes stagiaires",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: FutureBuilder<List>(
            future: getMesStagiaires(),
            builder: (context, resultat) {
              if (resultat.hasError) {
                return Center(
                  child: Text("erreur..."),
                );
              }
              if (!resultat.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (resultat == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final List list = resultat.data!;
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(list[index]["titre"]),
                                content: Container(
                                  height: 160,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (list[index]["rapport"]
                                              .isNotEmpty) {
                                            final anchor = html.AnchorElement(
                                                href:
                                                    list[index]["rapport"].last)
                                              ..setAttribute(
                                                  "download", "document.pdf")
                                              ..click();
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.download,
                                              size: 40,
                                            ),
                                            Text("telecharger rapport")
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Nom&Prenom:  ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(list[index]["nom"],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey))
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
                                          Text(list[index]["email"],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey))
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
                                          Text(list[index]["date_debut"],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey))
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
                                          Text(list[index]["date_fin"],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                actionsAlignment: MainAxisAlignment.spaceEvenly,
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text("Fermer"),
                                      )),
                                  ElevatedButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('stagiaires')
                                            .doc(list[index]["stageId"])
                                            .update({
                                          "status": "validé"
                                        }).whenComplete(() {
                                          Navigator.pop(context);
                                          setState(() {});
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text("Vaider"),
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
                                backgroundImage:
                                    AssetImage("assets/bhbank.jpg"),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index]["nom"],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      list[index]["titre"],
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
                  itemCount: list.length,
                );
              }
            }));
  }
}

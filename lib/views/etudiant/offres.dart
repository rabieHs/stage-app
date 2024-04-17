import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/etudiant/formulairedestage.dart';

import '../../core/constants.dart';

class Offres extends StatefulWidget {
  const Offres({Key? key}) : super(key: key);

  @override
  State<Offres> createState() => _OffresState();
}

class _OffresState extends State<Offres> {
  Stream<List<Map>> getMyOffers() {
    ///get ==> docs
    ///snapshot =>> List docs ==> event
    final result = FirebaseFirestore.instance.collection('offres').snapshots();
    return result.map((event) {
      return event.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

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
                "mes offres",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: StreamBuilder<List<Map>>(
            stream: getMyOffers(),
            builder: (context, resultat) {
              if (resultat.hasError) {
                return Center(
                  child: Container(
                    child: Text("Error getting data"),
                  ),
                );
              }
              if (resultat.data == null) {
                return CircularProgressIndicator();
              } else {
                final List<Map> list = resultat.data!;
                return GridView.builder(
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2,
                              color: Color.fromARGB(223, 7, 6, 6),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage("assets/bhbank.jpg"),
                                      fit: BoxFit.contain)),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(list[index]["titre"]),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("context de l'offre"),
                                        content: Container(
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Email: ",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    "Niveau:  ",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(list[index]["niveau"],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.grey))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Specialité:  ",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      list[index]["specialite"],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.grey))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "description :  ",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      list[index]
                                                          ["description"],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.grey))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        formulairedestage(
                                                      societe_id: list[index]
                                                          ["id"],
                                                      offre_id: list[index]
                                                          ["offre_id"],
                                                      nomSociete: list[index]
                                                          ["nom"],
                                                      titre: list[index]
                                                          ["titre"],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                child:
                                                    Text("remplir formulaire"),
                                              )),
                                        ],
                                      );
                                    });
                              },

                              // Navigator.pop(context);

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: primaryColor,
                              child: Container(
                                height: 45,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    "Voir",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
            })

        /*  , */
        );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/etudiant/modifier_formulaire.dart';

import '../../core/constants.dart';

class suividemande extends StatefulWidget {
  const suividemande({Key? key}) : super(key: key);

  @override
  State<suividemande> createState() => _suividemandeState();
}

class _suividemandeState extends State<suividemande> {
  Future<List<Map>> getMyDemands() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final result = await FirebaseFirestore.instance
        .collection('demandes')
        .where("user_id", isEqualTo: uid)
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
          backgroundColor: primaryColor,
          elevation: 0,
          title: const Text(
            "suivi demandes",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
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
            FutureBuilder<List<Map>>(
                future: getMyDemands(),
                builder: (context, resultat) {
                  if (resultat.hasError) {
                    print(resultat.error);
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (resultat.data == null) {
                    return CircularProgressIndicator();
                  } else {
                    final list = resultat.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: list[index]["status"] != "accepte"
                                ? () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ModifierFormulaire(
                                                    demande: list[index])));
                                  }
                                : null,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[index]["nom_societe"],
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
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: list[index]["status"] ==
                                              "en attente"
                                          ? Colors.orange
                                          : list[index]["status"] == "accepte"
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })

            /*   ListView(shrinkWrap: true, children: [
             
            ]), */
          ],
        ));
  }
}

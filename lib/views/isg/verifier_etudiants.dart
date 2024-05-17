import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stage_app/core/constants.dart';

class VerifierEtudiants extends StatefulWidget {
  const VerifierEtudiants({super.key});

  @override
  State<VerifierEtudiants> createState() => _VerifierEtudiantsState();
}

class _VerifierEtudiantsState extends State<VerifierEtudiants> {
  Future<List<Map>> getMyDemands() async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where("type", isEqualTo: "etudiant")
        .where("status", isNotEqualTo: "accepte")
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
            "Liste des etudiants",
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Etudiant"),
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
                                                  "Nom:  ",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(list[index]["name"],
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.grey))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "CIN:  ",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(list[index]["cin"],
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.grey))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(list[index]["id"])
                                                .update({
                                              "status": "accepte"
                                            }).whenComplete(() {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "etudiant accepté")));
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text("Accepter"),
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(list[index]["id"])
                                                .update({
                                              "status": "refuse"
                                            }).whenComplete(() {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "etudiant refusé")));
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text("refuser"),
                                        )
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
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[index]["name"],
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          Text(
                                            list[index]["cin"],
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
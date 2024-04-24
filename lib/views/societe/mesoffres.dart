import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/core/constants.dart';
import 'package:stage_app/views/societe/formulairedeloffre.dart';

class mesoffres extends StatefulWidget {
  const mesoffres({Key? key}) : super(key: key);

  @override
  State<mesoffres> createState() => _mesoffresState();
}

class _mesoffresState extends State<mesoffres> {
  Future<List<Map>> getMyOffers() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final result = await FirebaseFirestore.instance.collection('offres').get();
    final docs = result.docs;
    return docs.map((doc) {
      return doc.data();
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: fourthColor,
          elevation: 0,
          title: Text(
            "mes offres",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Formulairedeloffre()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.lightGreen,
                child: Container(
                    // height: 45,
                    width: 100,
                    child: Center(
                        child: Text(
                      "ajouter offre",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<Map>>(
            future: getMyOffers(),
            builder: (context, resultat) {
              if (resultat.hasError) {
                print(resultat.error);
                return Container(
                  child: Center(
                    child: Text("Error"),
                  ),
                );
              }
              if (resultat.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Map> list = resultat.data!;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
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
                                            "Niveau:  ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(list[index]["specialite"],
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(list[index]["description"],
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
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text("supprimer"),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text("modifier"),
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
                                      list[index]["type"],
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
                );
              }
            }));

    /*  */
  }
}

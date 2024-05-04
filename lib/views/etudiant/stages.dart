import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:html' as html;

import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants.dart';

class Stages extends StatefulWidget {
  const Stages({Key? key}) : super(key: key);

  @override
  State<Stages> createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  Uint8List? fileBytes;
  Future<List<Map>> getMesStagiaires() async {
    //get societe id
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final result = await FirebaseFirestore.instance
        .collection("stagiaires")
        .where("user_id", isEqualTo: uid)
        .get();
    return result.docs.map((doc) {
      print(doc.data());

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
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "mes stages",
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
                              return list[index]["status"] != "validé"
                                  ? AlertDialog(
                                      title: Text(list[index]["titre"]),
                                      content: InkWell(
                                        onTap: () async {
                                          final resultat = await FilePickerWeb
                                              .platform
                                              .pickFiles();
                                          if (resultat != null) {
                                            setState(() {
                                              fileBytes =
                                                  resultat.files.first.bytes!;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text("Fichier importé"),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 76, 175, 132),
                                            ));
                                          }
                                        },
                                        child: Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Icon(
                                                  Icons.upload_file,
                                                  size: 70,
                                                ),
                                              ),
                                              fileBytes == null
                                                  ? Text(
                                                      "importer votre rapport en format pdf")
                                                  : Text("fichier importé")
                                            ],
                                          ),
                                        ),
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () async {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: Text("fermer"),
                                            )),
                                        ElevatedButton(
                                            onPressed: () async {
                                              final Reference storage =
                                                  FirebaseStorage.instance.ref(
                                                      "${Uuid().v4()}.pdf");
                                              final task =
                                                  storage.putData(fileBytes!);
                                              await task;
                                              final downloadUrl = await storage
                                                  .getDownloadURL();
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        content: Text(
                                                            "Chargement..."),
                                                      ));
                                              await FirebaseFirestore.instance
                                                  .collection("stagiaires")
                                                  .doc(list[index]["stageId"])
                                                  .update({
                                                "rapport":
                                                    FieldValue.arrayUnion(
                                                        [downloadUrl])
                                              });
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text("Fichier envoyé"),
                                                backgroundColor: Colors.green,
                                              ));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: Text("envoyer"),
                                            )),
                                      ],
                                    )
                                  : AlertDialog(
                                      title: Text(
                                        "telechargement de l'attestation",
                                      ),
                                      content: Container(
                                        height: 100,
                                        child: InkWell(
                                          onTap: () {
                                            if (list[index]["rapport"]
                                                .isNotEmpty) {
                                              final anchor = html.AnchorElement(
                                                  href: list[index]
                                                      ["attestation"])
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
                                              Text("telecharger")
                                            ],
                                          ),
                                        ),
                                      ),
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
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: list[index]["status"] ==
                                        "en attente pour la validation"
                                    ? Colors.orange
                                    : list[index]["status"] == "validé"
                                        ? Colors.green
                                        : Colors.red,
                              ),
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

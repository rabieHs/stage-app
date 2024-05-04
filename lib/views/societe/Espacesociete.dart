import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/societe/Demandes.dart';
import 'package:stage_app/views/societe/Stagiaires.dart';
import 'package:stage_app/views/etudiant/offres.dart';
import 'package:stage_app/views/etudiant/stages.dart';
import 'package:stage_app/views/societe/mesoffres.dart';
import 'package:stage_app/views/welcome.dart';
import '../../core/constants.dart';
import 'Stages valid.dart';

class Espacesociete extends StatefulWidget {
  const Espacesociete({Key? key}) : super(key: key);

  @override
  State<Espacesociete> createState() => EspacesocieteState();
}

class EspacesocieteState extends State<Espacesociete>
    with SingleTickerProviderStateMixin {
  int index = 0;
  List interfaces = [
    Demandes(), Stagiaires(), mesoffres(), satgesvalides() //nom interface()
  ];
  late AnimationController _controller;

  getUser() async {
    final resultat = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      user = resultat.data()!;
    });
  }

  Map<String, dynamic> user = {};
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 23, 205, 183),
            elevation: 0,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "espace societe",
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
                accountName: Text(user["name"]),
                accountEmail: Text(user["email"])),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("mes demandes"),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("mes stagiaires"),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text("mes offres"),
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text("stages validés"),
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("deconnexion"),
              onTap: () async {
                await FirebaseAuth.instance.signOut().whenComplete(() =>
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Welcome())));
              },
            ),
          ]),
        ),
        body: interfaces[index]);
  }
}

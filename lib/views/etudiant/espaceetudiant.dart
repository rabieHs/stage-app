import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:stage_app/views/etudiant/offres.dart';
import 'package:stage_app/views/etudiant/stages.dart';
import 'package:stage_app/views/etudiant/suividemande.dart';
import 'package:stage_app/views/welcome.dart';

import '../../core/constants.dart';

class espaceetudiant extends StatefulWidget {
  const espaceetudiant({Key? key}) : super(key: key);

  @override
  State<espaceetudiant> createState() => _espaceetudiantState();
}

class _espaceetudiantState extends State<espaceetudiant>
    with SingleTickerProviderStateMixin {
  int index = 0;
  List interfaces = [Offres(), Stages(), suividemande()];
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
    super.initState();
    getUser();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "espace etudiant",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        drawer: Drawer(
          child: ListView(children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  onTap: () async {
                    final resultat = await FilePicker.platform.pickFiles();
                    if (resultat != null) {
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/logoo.png")),
                ),
                accountName: Text(user.isEmpty ? "" : user["name"]),
                accountEmail: Text(user.isEmpty ? "" : user["email"])),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("mes offres"),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("mes stages"),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.handshake_outlined),
              title: const Text("suivi demande"),
              onTap: () {
                setState(() {
                  index = 2;
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

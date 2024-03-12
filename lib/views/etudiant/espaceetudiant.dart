import 'dart:html';

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

  @override
  void initState() {
    super.initState();
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
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/logoo.png")),
                accountName: Text("nom et prenom"),
                accountEmail: Text("nomprenom@gmail.com")),
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
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
          ]),
        ),
        body: interfaces[index]);
  }
}

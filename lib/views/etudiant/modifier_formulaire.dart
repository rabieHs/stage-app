// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants.dart';

class ModifierFormulaire extends StatefulWidget {
  final demande;
  const ModifierFormulaire({
    required this.demande,
    Key? key,
  }) : super(key: key);

  @override
  State<ModifierFormulaire> createState() => _formulairedestageState();
}

class _formulairedestageState extends State<ModifierFormulaire> {
  final dateController = TextEditingController();
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final niveauController = TextEditingController();
  final dateFinController = TextEditingController();
  final specialiteController = TextEditingController();
  @override
  void initState() {
    dateController.text = widget.demande["date_debut"];
    nomController.text = widget.demande["nom"];
    emailController.text = widget.demande["email"];
    niveauController.text = widget.demande["niveau"];
    dateFinController.text = widget.demande["date_fin"];
    specialiteController.text = widget.demande["specialite"];
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier ce formulaire'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                            controller: nomController,
                            decoration: InputDecoration(
                                labelText: ' nom et prenom',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText: ' Email',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: specialiteController,
                            decoration: InputDecoration(
                                labelText: ' specialité',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: niveauController,
                            decoration: InputDecoration(
                                labelText: ' niveau',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: dateController,
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050));

                              if (date != null) {
                                setState(() {
                                  dateController.text =
                                      "${date.day} - ${date.month}- ${date.year}";
                                });
                              }
                            },
                            decoration: InputDecoration(
                                labelText: ' date début',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: dateFinController,
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050));

                              if (date != null) {
                                setState(() {
                                  dateFinController.text =
                                      "${date.day} - ${date.month}- ${date.year}";
                                });
                              }
                            },
                            decoration: InputDecoration(
                                labelText: ' date fin',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                ///
                                final offre_id = widget.demande["offre_id"];
                                final id =
                                    FirebaseAuth.instance.currentUser!.uid;
                                final demande_id = Uuid().v4();

                                final nom = nomController.text;
                                final email = emailController.text;
                                final niveau = niveauController.text;
                                final specialite = specialiteController.text;

                                final dateDebut = dateController.text;
                                final dateFin = dateFinController.text;

                                FirebaseFirestore.instance
                                    .collection('demandes')
                                    .doc(widget.demande["demande_id"])
                                    .update({
                                  "specialite": specialite,
                                  "nom": nom,
                                  "email": email,
                                  "niveau": niveau,
                                  "date_debut": dateDebut,
                                  "date_fin": dateFin,
                                }).whenComplete(() => Navigator.pop(context));

                                /// =>doc(demande_id) + donnees
                                // final nom = controller.text

                                /*  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("terminé"),
                                        content: Text(
                                            "hjjhhgjgbr;jhcr;jhtrj;hbtrjhtr;hjtrkhrjhrjtvcrvv"),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("exit"),
                                          )
                                        ],
                                      );
                                    }); */
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: primaryColor,
                              child: Container(
                                  height: 45,
                                  width: 200,
                                  child: Center(
                                      child: Text(
                                    "Modifier",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            MaterialButton(
                              onPressed: () {
                                ///
                                final offre_id = widget.demande["offre_id"];
                                final id =
                                    FirebaseAuth.instance.currentUser!.uid;
                                final demande_id = Uuid().v4();

                                final nom = nomController.text;
                                final email = emailController.text;
                                final niveau = niveauController.text;
                                final specialite = specialiteController.text;

                                final dateDebut = dateController.text;
                                final dateFin = dateFinController.text;

                                FirebaseFirestore.instance
                                    .collection('demandes')
                                    .doc(widget.demande["demande_id"])
                                    .delete()
                                    .whenComplete(() => Navigator.pop(context));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.red,
                              child: Container(
                                  height: 45,
                                  width: 200,
                                  child: Center(
                                      child: Text(
                                    "Supprimer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                          ],
                        ),
                      ]),
                ))));
  }
}
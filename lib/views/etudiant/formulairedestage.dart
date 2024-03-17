// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants.dart';

class formulairedestage extends StatefulWidget {
  final String offre_id;
  final String nomSociete;
  final String titre;
  final String societe_id;
  const formulairedestage({
    Key? key,
    required this.offre_id,
    required this.nomSociete,
    required this.titre,
    required this.societe_id,
  }) : super(key: key);

  @override
  State<formulairedestage> createState() => _formulairedestageState();
}

class _formulairedestageState extends State<formulairedestage> {
  final dateController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final niveauController = TextEditingController();
  final dateFinController = TextEditingController();
  final specialiteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(widget.offre_id);
    return Scaffold(
        appBar: AppBar(
          title: Text('remplir ce formulaire'),
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
                        MaterialButton(
                          onPressed: () {
                            ///
                            final offre_id = widget.offre_id;
                            final id = FirebaseAuth.instance.currentUser!.uid;
                            final demande_id = Uuid().v4();

                            final nom = nomController.text;
                            final email = emailController.text;
                            final niveau = niveauController.text;
                            final specialite = specialiteController.text;

                            final dateDebut = dateController.text;
                            final dateFin = dateFinController.text;

                            FirebaseFirestore.instance
                                .collection('demandes')
                                .doc(demande_id)
                                .set({
                              "societe_id": widget.societe_id,
                              "specialite": specialite,
                              "user_id": id,
                              "offre_id": offre_id,
                              "demande_id": demande_id,
                              "nom_societe": widget.nomSociete,
                              "nom": nom,
                              "email": email,
                              "niveau": niveau,
                              "date_debut": dateDebut,
                              "date_fin": dateFin,
                              "titre": widget.titre,
                              "status": "en attente",
                            });

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
                                "envoyer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ]),
                ))));
  }
}

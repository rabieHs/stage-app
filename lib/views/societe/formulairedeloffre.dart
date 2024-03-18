import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/societe/mesoffres.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants.dart';

class Formulairedeloffre extends StatefulWidget {
  const Formulairedeloffre({Key? key}) : super(key: key);

  @override
  State<Formulairedeloffre> createState() => _FormulairedeloffreState();
}

class _FormulairedeloffreState extends State<Formulairedeloffre> {
  final dateController = TextEditingController();
  final dateFinController = TextEditingController();
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final niveauController = TextEditingController();
  final specialiteController = TextEditingController();
  final descriptionController = TextEditingController();
  final titreController = TextEditingController();

  String dropdownvalue = 'one';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ajouter un offre'),
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
                            controller: titreController,
                            decoration: InputDecoration(
                                labelText: 'titre de stage',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: nomController,
                            decoration: InputDecoration(
                                labelText: "nom de l'entreprise",
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: specialiteController,
                            decoration: InputDecoration(
                                labelText: 'specialité',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText: ' Email',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: niveauController,
                            decoration: InputDecoration(
                                labelText: ' niveau',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 20.0),
                        Center(
                          child: DropdownButton<String>(
                            value: dropdownvalue,
                            hint: Text("Type"),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: 'one',
                                child: Text('saisonniaire'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'two',
                                child: Text('stagiaire'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        dropdownvalue == "one"
                            ? TextFormField(
                                controller: dateController,
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2050));

                                  if (date != null) {
                                    setState(() {
                                      dateController.text = date.toString();
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: ' date début',
                                    border: const OutlineInputBorder()))
                            : SizedBox(),
                        SizedBox(height: 10.0),
                        dropdownvalue == "one"
                            ? TextFormField(
                                controller: dateFinController,
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2050));

                                  if (date != null) {
                                    setState(() {
                                      dateFinController.text = date.toString();
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: ' date fin',
                                    border: const OutlineInputBorder()))
                            : SizedBox.shrink(),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: descriptionController,
                            maxLines: 50,
                            minLines: 8,
                            decoration: InputDecoration(
                                labelText: 'description',
                                border: const OutlineInputBorder())),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            onPressed: () async {
                              String nom = nomController.text;
                              String email = emailController.text;
                              String niveau = niveauController.text;
                              String description = descriptionController.text;
                              String specialite = specialiteController.text;
                              String titre = titreController.text;
                              String type = dropdownvalue == "one"
                                  ? "saisonniaire"
                                  : "stagiare";

                              String dateDebut = dateController.text;
                              String dateFin = dateFinController.text;
                              String id =
                                  FirebaseAuth.instance.currentUser!.uid;
                              String offreId = Uuid().v4();
                              await FirebaseFirestore.instance
                                  .collection("offres")
                                  .doc(offreId)
                                  .set({
                                "offre_id": offreId,
                                "id": id,
                                "description": description,
                                "specialite": specialite,
                                "nom": nom,
                                "email": email,
                                "niveau": niveau,
                                "type": type,
                                "date_debut": dateDebut,
                                "date_fin": dateFin,
                                "titre": titre,
                              }).whenComplete(() {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("terminé"),
                                        content:
                                            Text("loffre ajoutée avec succée"),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("exit"),
                                          )
                                        ],
                                      );
                                    });
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: primaryColor,
                            child: Container(
                              height: 45,
                              width: 200,
                              child: Center(
                                  child: Text(
                                "ajouter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      ]),
                ))));
  }
}

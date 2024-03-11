import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/societe/mesoffres.dart';

import '../../core/constants.dart';

class Formulairedeloffre extends StatefulWidget {
  const Formulairedeloffre({Key? key}) : super(key: key);

  @override
  State<Formulairedeloffre> createState() => _FormulairedeloffreState();
}

class _FormulairedeloffreState extends State<Formulairedeloffre> {
  final dateController = TextEditingController();
  final dateFinController = TextEditingController();
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
                            decoration: InputDecoration(
                                labelText: ' nom de l/entreprise',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: ' Email',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        TextFormField(
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
                                  dateController.text = date.toString();
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
                                  dateFinController.text = date.toString();
                                });
                              }
                            },
                            decoration: InputDecoration(
                                labelText: ' date fin',
                                border: const OutlineInputBorder())),
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
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
                        MaterialButton(
                            onPressed: () {
                              showDialog(
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

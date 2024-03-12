import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/constants.dart';

class formulairedestage extends StatefulWidget {
  const formulairedestage({Key? key}) : super(key: key);

  @override
  State<formulairedestage> createState() => _formulairedestageState();
}

class _formulairedestageState extends State<formulairedestage> {
  final dateController = TextEditingController();
  final dateFinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                            decoration: InputDecoration(
                                labelText: ' nom et prenom',
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

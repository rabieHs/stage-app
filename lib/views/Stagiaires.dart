import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/constants.dart';

class Stagiaires extends StatefulWidget {
  const Stagiaires({Key? key}) : super(key: key);

  @override
  State<Stagiaires> createState() => _StagiairesState();
}

class _StagiairesState extends State<Stagiaires> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreen,
          elevation: 0,
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "mes stagiaires",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ])),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/etudiant/formulairedestage.dart';

import '../../core/constants.dart';

class Offres extends StatefulWidget {
  const Offres({Key? key}) : super(key: key);

  @override
  State<Offres> createState() => _OffresState();
}

class _OffresState extends State<Offres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          elevation: 0,
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "mes offres",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ])),
      body: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(223, 7, 6, 6),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/bhbank.jpg"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("data"),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => formulairedestage()));

                      // Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    child: Container(
                        height: 45,
                        width: 200,
                        child: Center(
                            child: Text(
                          "remplir formulaire",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

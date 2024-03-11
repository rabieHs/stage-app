import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stage_app/views/societe/formulairedeloffre.dart';

class mesoffres extends StatefulWidget {
  const mesoffres({Key? key}) : super(key: key);

  @override
  State<mesoffres> createState() => _mesoffresState();
}

class _mesoffresState extends State<mesoffres> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 240, 125, 185),
          elevation: 0,
          title: Text(
            "mes offres",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Formulairedeloffre()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.lightGreen,
                child: Container(
                    // height: 45,
                    width: 100,
                    child: Center(
                        child: Text(
                      "ajouter offre",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ),
          ],
        ),
        body: ListView(children: [
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("context de l'offre"),
                      content: Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "position :  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("ay esm",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Email: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("ay esm",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Niveau:  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("3 émé ",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Specialité:  ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Informatique de gestion Informatique de gestion",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text("supprimer"),
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text("modifier"),
                            )),
                      ],
                    );
                  });
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/offre.jpg"),
            ),
            title: Text('loffre1'),
            subtitle: Text('titre'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/offre.jpg"),
            ),
            title: Text('offre2'),
            subtitle: Text('titre'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/offre.jpg"),
            ),
            title: Text('offre3'),
            subtitle: Text('titre'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/offre.jpg"),
            ),
            title: Text('offre4'),
            subtitle: Text('titre'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/offre.jpg"),
            ),
            title: Text('offre5'),
            subtitle: Text('titre'),
            trailing: Icon(Icons.navigate_next),
            minLeadingWidth: 100,
          ),
        ]));
  }
}
//lista feha loffre li 7atethom shrika w fhea show dialog mt3 caracteristique t3 offre wboutton ajouter offee jdid f lista
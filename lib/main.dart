import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stage_app/controllers/authentication.dart';
import 'package:stage_app/firebase_options.dart';
import 'package:stage_app/test.dart';
import 'package:stage_app/views/etudiant/espaceetudiant.dart';

import 'package:stage_app/views/societe/Espacesociete.dart';
import 'package:stage_app/views/register.dart';
import 'package:stage_app/views/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String user_type = "";

  @override
  void initState() {
    super.initState();
    final user = AuthenticationController().getUser().then((user) {
      setState(() {
        user_type = user.type;
      });
    });
  }

  // This widget is the root of your application.

  ///
  ///if(){}else{}
  ///var==var ? si oui (action a) : si non (action b)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: FirebaseAuth.instance.currentUser == null
          ? Welcome()
          : user_type == "etudiant"
              ? espaceetudiant()
              : user_type == "societe"
                  ? Espacesociete()
                  : Welcome(),
    );
  }
}

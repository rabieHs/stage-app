import 'package:flutter/material.dart';
import 'package:stage_app/test.dart';
import 'package:stage_app/views/etudiant/stages.dart';

import 'package:stage_app/views/societe/Espacesociete.dart';
import 'package:stage_app/views/register.dart';
import 'package:stage_app/views/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Welcome(),
    );
  }
}

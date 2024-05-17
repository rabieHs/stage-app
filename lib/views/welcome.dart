import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stage_app/controllers/authentication.dart';
import 'package:stage_app/views/etudiant/espaceetudiant.dart';

import 'package:stage_app/views/register.dart';
import 'package:stage_app/views/societe/Espacesociete.dart';

import '../core/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("run....");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Row(
        children: [
          Expanded(
              /////////////////
              flex: 3,
              child: Column(
                children: [
                  Container(
                      height: 300,
                      width: 300,
                      color: Colors.white,
                      child: Image.asset(
                        "assets/login.png",
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      "ekfjbsqk:jgfbdkgbdfs:kgdfsk:gjbfsd:kgbdfsg:kfbsg:ksfbg:sf")
                ],
              )
              /////////////////
              ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                decoration: BoxDecoration(
                    color: formBackgroundColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: secondaryColor)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "SignUP",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: fieldBackgroundColor,
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        //filled: true,
                        //fillColor: fieldBackgroundColor,
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: fieldBackgroundColor,
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        //filled: true,
                        //fillColor: fieldBackgroundColor,
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        final email = emailController.text;
                        final password = passwordController.text;

                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("les champs est vides !"),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                        final result = await AuthenticationController()
                            .login(email, password);

                        if (result == true) {
                          final user =
                              await AuthenticationController().getUser();

                          if (user.type == "etudiant") {
                            if (user.status == "en attente") {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "your account not verified yet please wait or contact the administration")));
                            } else {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => espaceetudiant()));
                            }
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Espacesociete()));
                          }
                        } else {
                          print("error");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: primaryColor,
                      child: Container(
                          height: 45,
                          width: 200,
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "You Don't have An Acccount? ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Register())),
                              text: "Register",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

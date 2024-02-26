import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: Column(
          children: [DrawerHeader(child: Container())],
        ),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    "assets/login.png",
                  ))),
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
                      "Login",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    TextField(
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
                      onPressed: () {},
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
                      text: const TextSpan(
                          text: "You Don't have An Acccount? ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
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

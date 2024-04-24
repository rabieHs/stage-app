import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  late String pdfUrl;

  @override
  void initState() {
    super.initState();
    _getPDFUrl();
  }

  void _getPDFUrl() async {
    try {
      final DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('your_collection')
          .doc('your_document')
          .get();
      setState(() {
        pdfUrl =
            "https://firebasestorage.googleapis.com/v0/b/stage-db-2c0b5.appspot.com/o/ac27b103-a050-4613-8e33-33a7f00f9dc5.pdf?alt=media&token=fb2c198f-5e00-4f0a-8b6a-2812116d7c55";
      });
    } catch (error) {
      print("Error getting PDF URL: $error");
    }
  }

  void _downloadPDF() {
    if (pdfUrl.isNotEmpty) {
      final anchor = html.AnchorElement(href: pdfUrl)
        ..setAttribute("download", "document.pdf")
        ..click();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Download'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _downloadPDF,
          child: Text('Download PDF'),
        ),
      ),
    );
  }
}

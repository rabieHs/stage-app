import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'pdf_viewer_page.dart';

class PDFApi {
  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final filenaeme = basename(path);

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filenaeme');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}

void openPDF(BuildContext context, File file) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}

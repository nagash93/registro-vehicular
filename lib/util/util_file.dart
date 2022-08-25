import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class UtilFile {
  void openFile(String nameFile) async {
    try {
      OpenFile.open(
          "${(await getExternalStorageDirectory())!.path}/$nameFile.txt");
    } catch (e) {
      log("Error: $e");
    }
  }

  void writeFileDownload(
    String nameFile, {
    BuildContext? context,
  }) async {
    File internalFile =
        File("${(await getExternalStorageDirectory())!.path}/$nameFile.txt");
    File newFile = File("/storage/emulated/0/Download/$nameFile.txt");
    final code = internalFile.readAsBytesSync();
    newFile.writeAsBytesSync(code);
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Archivo Guardado'),
            duration: Duration(seconds: 1)
        ),
      );
    }
  }
}

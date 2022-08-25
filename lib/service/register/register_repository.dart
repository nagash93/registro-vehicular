import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:registro_vehicular/model/item_register_model.dart';

class RegisterRepository {
  Future writeRegisterItem(ItemRegisterModel item, String fileName) async {
    if (await Permission.storage.request().isGranted) {
      String dir =
          "${(await getExternalStorageDirectory())!.path}/${fileName}.txt";
      File f = File(dir);
      String newItem =
          "${item.timeNow},${item.move},${item.type},${item.place}, ${item.project},  \n";
      try {
        await f.writeAsString(newItem, mode: FileMode.append);
      } catch (e) {
        debugPrint("Error: $e");
      }
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }
}

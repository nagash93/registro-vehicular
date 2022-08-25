import 'package:permission_handler/permission_handler.dart';

class PermissionHandler{

  Future<void> getPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
  Permission.storage,
  ].request();
  }

}
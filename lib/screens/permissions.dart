import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  // Request permissions for reading and writing storage.

  static Future<bool> requestLocationPermissions() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  static Future<bool> hasLocationPermissions() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }
}

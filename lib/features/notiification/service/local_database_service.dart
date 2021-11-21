import 'dart:convert';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseService {
  static const boxName = 'notification';
  static const boxNey = 'notifications_data';

  Future<void> openNotificationsBox() async {
    await Hive.openBox(boxName);
  }

  Future<void> saveNotificationData(Map<String, dynamic> data) async {
    final Box box = Hive.box(boxName);

    final List<Map<String, dynamic>> savedData = await getNotificationData();

    await box.put(boxNey, [data, ...savedData]);
  }

  Future<List<Map<String, dynamic>>> getNotificationData() async {
    final Box box = Hive.box(boxName);

    final List<dynamic> data = List<dynamic>.from(await box.get(boxNey) ?? []);

    if (data.isEmpty) return [];

    List<Map<String, dynamic>> result =
        data.map((e) => Map<String, dynamic>.from(e)).toList();

    log(result.toString());
    return result;
  }
}

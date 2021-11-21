import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseService {
  static const boxName = 'notification';
  static const boxKey = 'notifications_data';

  Future<void> openNotificationsBox() async {
    await Hive.openBox(boxName);
  }

  Stream<BoxEvent> notificationDataStream() async* {
    yield* Hive.box(boxName).watch(key: boxKey);
  }

  Future<void> saveNotificationData(Map<String, dynamic> data) async {
    final Box box = Hive.box(boxName);

    final List<Map<String, dynamic>> savedData = await getNotificationData();

    await box.put(boxKey, [data, ...savedData]);
  }

  Future<List<Map<String, dynamic>>> getNotificationData() async {
    final Box box = Hive.box(boxName);

    final List<dynamic> data = List<dynamic>.from(await box.get(boxKey) ?? []);

    if (data.isEmpty) return [];

    List<Map<String, dynamic>> result =
        data.map((e) => Map<String, dynamic>.from(e)).toList();

    // log(result.toString());
    return result;
  }
}

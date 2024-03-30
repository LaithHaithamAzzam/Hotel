import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationService {

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> showNotification(String title , String body) async {
    NotificationService.flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('appicon'),
      ),
    );
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      '$title',
      '$body',
      platformChannelSpecifics,
      payload: 'Hello World',

    );
  }

}

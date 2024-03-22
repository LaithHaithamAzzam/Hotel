import 'package:flutter_local_notifications/flutter_local_notifications.dart';



FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
not()async {
  var initializationSettingsAndroid = AndroidInitializationSettings('');
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', importance: Importance.max, priority: Priority.high, ticker: 'ticker');

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
      0, 'Notification Title', 'Notification Body', platformChannelSpecifics,
      payload: 'item x');

}

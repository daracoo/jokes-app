import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/services.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();


  Future<void> initialize() async {
    tz.initializeTimeZones();
    final localTimeZone = tz.local;
    print('Local Time Zone: ${localTimeZone}');

    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: androidSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({required String title, required String body}) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Shows a test notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }


  Future<void> scheduleDailyNotification({
    required String joke,
    required int hour,
    required int minute,
  }) async {
    // Initialize the current and scheduled times
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final tz.TZDateTime scheduleTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // Adjust if the time is in the past
    final tz.TZDateTime adjustedScheduleTime =
    scheduleTime.isBefore(now) ? scheduleTime.add(const Duration(days: 1)) : scheduleTime;

    // Debugging: Print the scheduled time
    print("Scheduled Notification Time: $adjustedScheduleTime");

    // Define Android-specific notification details
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'daily_joke_channel',
      'Daily Joke Notifications',
      channelDescription: 'Receive a joke of the day notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    try {
      // Schedule the notification
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Joke of the Day',
        joke,
        adjustedScheduleTime,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );

      print("Scheduled notification successfully!");
    } catch (e) {
      print("Failed to schedule notification: $e");
    }
  }

}

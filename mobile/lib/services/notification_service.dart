import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Initialize timezone data
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint('Notification clicked: ${details.payload}');
      },
    );

    // Schedule daily reminder at 9 PM
    await scheduleDailyReminder();
  }

  static tz.TZDateTime _nextInstanceOfNinePM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 21, 0, 0);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> scheduleDailyReminder() async {
    try {
      await _notificationsPlugin.zonedSchedule(
        id: 42, // Unique notification ID
        title: 'DAILY QUEST WARNING',
        body: 'Monarch, your Daily Quests have not been finished. Arise before the gate closes!',
        scheduledDate: _nextInstanceOfNinePM(),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_quest_reminder_channel',
            'Quest Reminders',
            channelDescription: 'Warning when daily quests remain incomplete',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      debugPrint('Scheduled daily reminder for 9 PM local time.');
    } catch (e) {
      debugPrint('Failed to schedule daily reminder: $e');
    }
  }

  static Future<void> showInstantNotification({required String title, required String body}) async {
    try {
      await _notificationsPlugin.show(
        id: 99,
        title: title,
        body: body,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'instant_channel',
            'General Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );
    } catch (e) {
      debugPrint('Failed to show instant notification: $e');
    }
  }
}

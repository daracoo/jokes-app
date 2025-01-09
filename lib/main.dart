import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'services/notification_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Timezone data
  tz.initializeTimeZones();

  // Initialize Notification Service
  final NotificationService notificationService = NotificationService();
  await notificationService.initialize();

  runApp(MyApp(notificationService: notificationService));
}

class MyApp extends StatelessWidget {
  final NotificationService notificationService;

  const MyApp({super.key, required this.notificationService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(notificationService: notificationService),
      title: 'Jokes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
    );
  }
}

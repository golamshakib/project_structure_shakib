import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'core/services/auth_service.dart';
import 'core/services/firebase_messaging_services.dart';
import 'core/services/local_notification_service.dart';
import 'core/utils/logging/loggerformain.dart';
// import 'package:notification_services_android_ios/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Load environment variables
  await dotenv.load(fileName: '.env');  // Must need to initialize before Firebase

  await AuthService.init();
  // /// Firebase Initialization
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // /// Initialize Local Notification Service
  // final localNotificationService = LocalNotificationService.instance();
  // await localNotificationService.init();
  // /// Initialize Firebase Messaging Service
  // final firebaseMessagingService = FirebaseMessagingService.instance();
  // await firebaseMessagingService.init(
  //   localNotificationService: localNotificationService,
  // );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (value) {
      Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
      runApp(const MyApp());
    },
  );
}
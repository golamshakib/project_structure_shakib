import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/services/local_storage_service.dart';
import 'core/utils/logging/loggerformain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.instance.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(const ProviderScope(child: MyApp()));
  });
}

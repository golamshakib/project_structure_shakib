import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/cupertino.dart';
import 'package:ps_shakib/routes/app_routes.dart';
import 'core/utils/constants/app_sizer.dart';
import 'core/utils/constants/app_sizes.dart';
import 'core/utils/theme/theme.dart';

class PlatformUtils {
  static bool get isIOS =>
      foundation.defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isAndroid =>
      foundation.defaultTargetPlatform == TargetPlatform.android;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoute.routes,
          themeMode: ThemeMode.light,
          theme: _getLightTheme(),
          darkTheme: _getDarkTheme(),
          builder:
              (context, child) =>
                  PlatformUtils.isIOS
                      ? CupertinoTheme(
                        data: const CupertinoThemeData(),
                        child: child!,
                      )
                      : child!,
        );
      },
    );
  }

  ThemeData _getLightTheme() {
    return PlatformUtils.isIOS
        ? AppTheme.lightTheme.copyWith(platform: TargetPlatform.iOS)
        : AppTheme.lightTheme;
  }

  ThemeData _getDarkTheme() {
    return PlatformUtils.isIOS
        ? AppTheme.darkTheme.copyWith(platform: TargetPlatform.iOS)
        : AppTheme.darkTheme;
  }
}

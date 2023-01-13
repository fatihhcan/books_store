import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/init/navigation/navigation_routes.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme_manager.dart';
import 'core/utility/shared_prefs.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPrefs.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        theme: AppThemeManager.instance.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
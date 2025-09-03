import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';
import 'core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'el_hou',
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
    );
  }
}

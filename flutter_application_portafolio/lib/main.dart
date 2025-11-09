import 'package:flutter/material.dart';
import 'package:flutter_application_portafolio/routes/app_routes.dart';
import 'package:flutter_application_portafolio/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      theme: AppTheme.darkTheme,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_portafolio/models/menu_options.dart';
import 'package:flutter_application_portafolio/screens/home_screen.dart';
import 'package:flutter_application_portafolio/screens/info_screen.dart';
import 'package:flutter_application_portafolio/screens/videojuegos_screen.dart';
import 'package:flutter_application_portafolio/screens/contacto_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
      route: '/info',
      icon: Icons.person,
      title: 'Información',
      screen: const InfoScreen(title: 'Información'),
    ),
    MenuOptions(
      route: '/videojuegos',
      icon: Icons.videogame_asset,
      title: 'Videojuegos',
      screen: const VideojuegosScreen(title: 'Videojuegos'),
    ),
    MenuOptions(
      route: '/contacto',
      icon: Icons.contact_mail,
      title: 'Contacto',
      screen: const ContactoScreen(title: 'Contacto'),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      '/home': (BuildContext context) => const HomeScreen(title: 'Menú'),
      '/info': (BuildContext context) => const InfoScreen(title: 'Información'),
      '/contacto': (BuildContext context) =>
          const ContactoScreen(title: 'Contacto'),
    });

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}

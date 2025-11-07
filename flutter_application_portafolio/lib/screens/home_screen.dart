import 'package:flutter/material.dart';
import 'package:flutter_application_portafolio/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final options = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Pantalla Principal'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final opt = options[index];
          return ListTile(
            leading: Icon(opt.icon),
            title: Text(opt.title),
            onTap: () {
              Navigator.pushNamed(context, opt.route);
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// Removed unused import to avoid circular/unused import issues

class contacto_screen extends StatefulWidget {
  const contacto_screen({super.key, required this.title});

  final String title;

  @override
  State<contacto_screen> createState() => _contacto_screenState();
}

class _contacto_screenState extends State<contacto_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Si el usuario pulsa la pestaña de Información, navegamos a la ruta correspondiente
    if (index == 1) {
      Navigator.pushNamed(context, '/info');
    }
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/contacto');
    }
  }

  Future<void> _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir la URL')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al abrir la URL: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.teal),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white, // Color blanco
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Info'),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contacto',
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                // GitHub
                ListTile(
                  leading: const Icon(
                    Icons.alternate_email,
                    color: Colors.purpleAccent,
                  ),
                  title: const Text('GitHub'),
                  subtitle: const Text('Ginosaurio04'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () =>
                      _launchURL(context, 'https://github.com/Ginosaurio04'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

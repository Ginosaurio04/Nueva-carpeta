import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class info_screen extends StatefulWidget {
  const info_screen({super.key, required this.title});

  final String title;

  @override
  State<info_screen> createState() => _info_screenState();
}

class _info_screenState extends State<info_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Si el usuario pulsa la pestaña de Información, navegamos a la ruta correspondiente
    if (index == 1) {
      Navigator.pushNamed(context, '/info');
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
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Acerca del Desarrollador'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white, // Color blanco
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Info'),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          // Sección de Encabezado/Perfil
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 30),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  // Avatar o Logo
                  CircleAvatar(
                    radius: 50,
                    // Usamos NetworkImage para URLs de internet
                    backgroundImage: const AssetImage(
                      'assets/Imagen de WhatsApp 2025-10-27 a las 21.03.40_2b373c4c.jpg',
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                  ),
                  const SizedBox(height: 20),
                  // Nombre del Desarrollador
                  const Text(
                    'Gino Cova (Ginosaurio)',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  // Rol/Título
                  Text(
                    'Estudiante y futuro Ingeniero de Sistemas',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Text(
              'Gustos y Pasatiempos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),

          Card(
            elevation: 4,
            child: Column(
              children: <Widget>[
                ListTile(
                  // Navegar a la pantalla de videojuegos
                  onTap: () {
                    Navigator.pushNamed(context, '/videojuegos');
                  },
                  leading: const Icon(
                    Icons.videogame_asset,
                    color: Colors.redAccent,
                  ),
                  title: const Text('VideoJuegos Favoritos'),
                  subtitle: const Text(
                    'The Last of Us, God of war 3, Final Fantasy 7',
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Text(
              'Contacto y Portafolio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),

          // Tarjeta con información de contacto
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

          const SizedBox(height: 30),

          // Información Adicional
          Text(
            'Versión de la App: 1.0.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

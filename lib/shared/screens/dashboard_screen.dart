import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DashboardScreen extends StatelessWidget {

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(FontAwesome.user),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(FontAwesome.cogs),
              title: const Text('Preferencias'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(FontAwesome.history),
              title: const Text('Historial'),
              onTap: () {
                Navigator.pushNamed(context, '/historial');
              },
            ),
            ListTile(
              leading: const Icon(FontAwesome.map_marker),
              title: const Text('Ubicación'),
              onTap: () {
                Navigator.pushNamed(context, '/ubicacion');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(child: Text('Dashboard')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user_photo.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nombre del Usuario',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(FontAwesome.map_marker),
                      onPressed: () {
                        // Acción del ícono de ubicación
                      },
                    ),
                    const Text('Location'),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(FontAwesome.heart),
                      onPressed: () {
                        // Acción del ícono de favoritos
                      },
                    ),
                    const Text('Favorites'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(FontAwesome.camera),
                      onPressed: () {
                        // Acción del ícono de traducir
                      },
                    ),
                    const Text('Translate'),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(FontAwesome.history),
                      onPressed: () {
                        // Acción del ícono de historial
                      },
                    ),
                    const Text('History'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


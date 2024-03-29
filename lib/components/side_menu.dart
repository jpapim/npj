import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromARGB(255, 24, 18, 43),
      ),
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120,
              width: 100,
              margin: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 24, 18, 43),
                  image: DecorationImage(
                      image: AssetImage("assets/images/gpro.png"),
                      fit: BoxFit.fill)),
              child: const Text(''),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context,('/'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper, color: Colors.white),
              title: const Text('Processos',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context,('/process'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Assistidos',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, ('/clients'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.white),
              title: const Text('Relatórios',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/reports');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month, color: Colors.white),
              title:
                  const Text('Agenda', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/schedule');
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart, color: Colors.white),
              title: const Text('Estatisticas',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/statistics');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Configurações',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/settings');
              },
            )
          ],
        ),
      ),
    );
  }
}

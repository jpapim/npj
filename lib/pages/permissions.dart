import 'package:flutter/material.dart';

import 'assisted.dart';
import 'reports.dart';
import 'schedule.dart';
import 'settings.dart';
import 'statistics.dart';

void main() => runApp(const PermissionsPage());

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  static const appTitle = 'GProJuridico';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyPermissionsPage(title: appTitle),
    );
  }
}

class MyPermissionsPage extends StatelessWidget {
  const MyPermissionsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Permissões'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("../imagens/logo.jpg"),
                     fit: BoxFit.cover)
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Assistidos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssistedPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Permissões'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PermissionsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Relatórios'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Agenda'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SchedulePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Estatisticas'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatisticsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Configurações'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  }
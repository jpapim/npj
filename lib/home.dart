import 'package:flutter/material.dart';
import 'package:npj/pages/assisted_Process.dart';

import 'pages/assisted.dart';
import 'pages/permissions.dart';
import 'pages/reports.dart';
import 'pages/schedule.dart';
import 'pages/settings.dart';
import 'pages/statistics.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const appTitle = 'GPRO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 15, 12, 29),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 24, 18, 43),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 44,
            fontFamily: "Built-SemiBold",
            color: Colors.white,
          ),
        ),
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      //Header com "ASSISTIDO"
      body: Column(
        children: [
          Container(
            height: 50,
            color: const Color.fromARGB(255, 50, 39, 85),
            child: const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "HOMEPAGE",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 200,
              ),
              child: Text('Página principal'),
            ),
          ),
        ],
      ),

      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 24, 18, 43),
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
                      image: AssetImage("../assets/imagens/gpro.png"),
                      fit: BoxFit.fill),
                ),
                child: const Text(''),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title:
                    const Text('Menu', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu, color: Colors.white),
                title: const Text('Assistidos',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AssistedProcessPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text('Permissões',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PermissionsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.download, color: Colors.white),
                title: const Text('Relatórios',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month, color: Colors.white),
                title:
                    const Text('Agenda', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SchedulePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart, color: Colors.white),
                title: const Text('Estatisticas',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StatisticsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Configurações',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

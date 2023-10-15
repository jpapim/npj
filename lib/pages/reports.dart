import 'package:flutter/material.dart';
import 'package:npj/components/header_theme.dart';
import 'package:npj/components/side_menu.dart';

void main() => runApp(const ReportsPage());

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  static const appTitle = 'GPRO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: HeaderTheme.getAppTheme(),
      home: const MyReportsPage(title: appTitle),
    );
  }
}

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
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
                      "RELATÓRIOS",
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
              child: Text('Relatórios'),
            ),
          ),
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}

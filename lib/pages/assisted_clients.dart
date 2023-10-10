import 'package:flutter/material.dart';
import 'package:npj/components/side_menu.dart';

void main() => runApp(const AssistidosPage());

class AssistidosPage extends StatelessWidget {
  const AssistidosPage({super.key});

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
      home: const MyAssistidosPage(title: appTitle),
    );
  }
}

class MyAssistidosPage extends StatelessWidget {
  const MyAssistidosPage({super.key, required this.title});

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
                      "ASSISTIDOS",
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
              child: Text('ASSISTIDOS'),
            ),
          ),
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:npj/components/side_menu.dart';
import 'package:npj/components/user_menu.dart';

class AssistedClientsPage extends StatelessWidget {
  const AssistedClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPRO"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: UserPopupMenu(),
          ),
        ],
      ),
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

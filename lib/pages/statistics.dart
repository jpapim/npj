import 'package:flutter/material.dart';
import 'package:npj/components/header_title.dart';
import 'package:npj/components/side_menu.dart';
import 'package:npj/components/user_menu.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

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
      body: const Column(
        children: [
          HeaderTitle(title: "ESTATÍSTICAS")
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../login.dart';
import '../home.dart';
import 'reports.dart';
import 'schedule.dart';
import 'permissions.dart';
import 'settings.dart';
import 'statistics.dart';

class AssistedPage extends StatefulWidget {
  @override
  _AssistedPageState createState() => _AssistedPageState();
}

class _AssistedPageState extends State<AssistedPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AssistedPage(),
    ReportsPage(),
    SchedulePage(),
    PermissionsPage(),
    StatisticsPage(),
    SettingsPage(),
  ];

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    } catch (e) {
      print('Error: $e');
      // Aqui você pode exibir uma mensagem de erro ao usuário, se necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Assisted',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Permissions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

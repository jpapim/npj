import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:npj/pages/add_process.dart';
import 'package:npj/pages/assisted_clients.dart';
import 'package:npj/pages/assisted_process.dart';
import 'package:npj/pages/edit_process.dart';
import 'package:npj/pages/forget_password.dart';
import 'package:npj/pages/home.dart';
import 'package:npj/pages/login.dart';
import 'package:npj/pages/register.dart';
import 'package:npj/pages/reports.dart';
import 'package:npj/pages/schedule.dart';
import 'package:npj/pages/settings.dart';
import 'package:npj/pages/statistics.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPRO',
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(), // altere aqui caso deseje utilizar uma página direto
        '/process': (context) => const AssistedProcessPage(),
        '/addProcess': (context) => const AddProcessPage(),
        '/editProcess': (context) => const EditProcessPage(),
        '/clients': (context) => const AssistedClientsPage(),
        '/statistics': (context) => const StatisticsPage(),
        '/schedule': (context) => const SchedulePage(),
        '/reports': (context) => const ReportsPage(),
        '/settings': (context) => const SettingsPage(),
        // usuario:
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgetPage': (context) => ForgetPasswordPage(),
      }
    );
  }
}

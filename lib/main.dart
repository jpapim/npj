import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:npj/components/header_theme.dart';
import 'package:npj/pages/home.dart';
import 'services/firebase_options.dart';

//import 'home.dart';
//import 'register.dart';

Future<void> main() async {
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
      theme: HeaderTheme.getAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      }, //alterar aqui página inicial modo teste
    );
  }
}

import 'package:flutter/material.dart';
import 'package:npj/home.dart';

import 'permissions.dart';
import 'reports.dart';
import 'schedule.dart';
import 'settings.dart';
import 'statistics.dart';

class User {
  final String username;
  final String statusAssitido;
  final String processo;
  final String urlAvatar;
  final String triagem;

  const User({
    required this.urlAvatar,
    required this.statusAssitido,
    required this.processo,
    required this.username,
    required this.triagem,
  });
}

class AssistedPage extends StatelessWidget {
  const AssistedPage({Key? key});

  static const appTitle = 'GProJuridico';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyAssistedPage(title: appTitle),
    );
  }
}

final _formKey = GlobalKey<FormState>();

class MyAssistedPage extends StatefulWidget {
  const MyAssistedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAssistedPage> createState() => _MyAssistedPageState();
}

class _MyAssistedPageState extends State<MyAssistedPage> {
  List<User> users = [
    const User(
      username: 'Sarah Abs',
      statusAssitido: "Representante Legal",
      processo: "54365",
      triagem: "4522",
      urlAvatar: "../../imagens/avatarfeminino.png",
    ),
    const User(
      username: 'Nina quem',
      statusAssitido: "Representante Legal",
      processo: "54325",
      triagem: "4522",
      urlAvatar: '../../imagens/avatarfeminino.png',
    ),
    const User(
      username: 'Steve richard',
      statusAssitido: "Representante Legal",
      processo: "54375",
      triagem: "4522",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Assistido",
      processo: "54385",
      triagem: "4111",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Assistido",
      processo: "78555",
      triagem: "4522",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Assistido",
      processo: "99343",
      triagem: "4112",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Representante Legal",
      processo: "12312",
      triagem: "2134",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Assistido",
      processo: "99343",
      triagem: "4112",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Representante Legal",
      processo: "12312",
      triagem: "2134",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Assistido",
      processo: "99343",
      triagem: "4112",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Assistido",
      processo: "99343",
      triagem: "4112",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
    const User(
      username: 'Fernando Silva',
      statusAssitido: "Representante Legal",
      processo: "12312",
      triagem: "2134",
      urlAvatar: '../../imagens/avatarMasculino.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu dos Assistidos',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Wrap(
                    spacing: 12,
                    children: [
                      IconButton(
                        onPressed: () => _dialogBuilder(context),
                        icon: const Icon(Icons.add),
                      ),
                      const Text(
                        "Adicionar Assistido",
                        style: TextStyle(fontSize: 25, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Wrap(
                    spacing: 12,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Filtrar por assistido, processo, triagem...",
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(user.urlAvatar),
                      backgroundColor: Colors.white,
                    ),
                    title: Text("${user.username} (${user.statusAssitido})"),
                    subtitle: Text("número processo ${user.processo} / triagem ${user.triagem}"),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_file,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.save,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.list,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.tune,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.folder,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("../imagens/logo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Permissões'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PermissionsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Relatórios'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Agenda'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SchedulePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Estatisticas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatisticsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Configurações'),
              onTap: () {
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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Adicionar Assistido'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      icon: Icon(Icons.account_box),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Processo",
                      icon: Icon(Icons.description),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Triagem",
                      icon: Icon(Icons.find_in_page),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle1,
              ),
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle1,
              ),
              child: const Text('Cadastrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

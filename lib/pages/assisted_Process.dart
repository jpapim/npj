import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:npj/home.dart';
import 'package:npj/pages/addProcess.dart';
import 'package:npj/pages/edit_processo.dart';
import 'package:npj/pages/permissions.dart';
import 'package:npj/pages/reports.dart';
import 'package:npj/pages/schedule.dart';
import 'package:npj/pages/settings.dart';
import 'package:npj/pages/statistics.dart';
import 'package:npj/services/firebase_service.dart';

class AssistedProcessPage extends StatelessWidget {
  const AssistedProcessPage({Key? key});

  static const appTitle = 'GProJuridico';

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
      initialRoute: '/',
      routes: {
        '/addProcess': (context) => const AddProcessoPage(),
        '/editProcess': (context) => const EditarProcesso(),
      },
      home: const MyAssistedPage(title: appTitle),
    );
  }
}

class MyAssistedPage extends StatefulWidget {
  const MyAssistedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAssistedPage> createState() => _MyAssistedPageState();
}

class _MyAssistedPageState extends State<MyAssistedPage> {
  List<Data> allData = [];
  List<Data> filteredData = [];

  @override
  void initState() {
    super.initState();
    getDataFromFirestore();
  }

  getDataFromFirestore() async {
    var data = await FirebaseFirestore.instance.collection("processo").get();
    allData = data.docs
        .map((doc) => Data(
              idProcesso: doc.id,
              numeroProcesso: doc["numeroProcesso"],
              aberturaProcesso: doc["aberturaProcesso"],
              acao: doc["acao"],
              dataDistricuicao: doc["dataDistricuicao"],
              varaProcesso: doc["varaProcesso"],
              forumProcesso: doc["forumProcesso"],
              statusProcesso: doc["statusProcesso"],
            ))
        .toList();
    setState(() {
      filteredData = allData;
    });
  }

  void filterData(String searchText) {
    setState(() {
      filteredData = allData
          .where((data) => data.numeroProcesso!
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GPRO")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/addProcess');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          //Header com "ASSISTIDO"
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
          //Container da barra de buscar
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                size: 30,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_alt)),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 1),
                    height: 40,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 50, 39, 85),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(5),
                          right: Radius.circular(0),
                        )),
                    child: const Align(
                        alignment: AlignmentDirectional(-0.5, 0),
                        child: Text(
                          "N° do processo",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w200),
                        )),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.8,
                        ),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(0),
                          right: Radius.circular(5),
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "    Search",
                          suffixIcon: Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          filterData(value);
                        },
                      ),
                    ),
                  ),
                  const Flexible(flex: 6, child: SizedBox())
                ],
              ),
            ),
          ),
          // Mostrar Linha do caminho
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, top: 5, right: 5, bottom: 5),
                  height: 35,
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                          top: BorderSide(width: 0.5),
                          bottom: BorderSide(width: 0.5))),
                  child: const Text(
                    "Tudo > Ação = XXXXXXXX > Status = Ativo",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
          //Final Mostrar Linha do caminho
          //ListView Inicio
          Expanded(
            child: PaginatedDataTable2(
              showFirstLastButtons: true,
              source: MyData2(filteredData, context),
              headingRowHeight: 40,
              rowsPerPage: 7,
              minWidth: 1300,
              columnSpacing: double.minPositive,
              columns: const [
                DataColumn(
                    label: Center(
                  child: Text("N° de processo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Aberto em",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Ação",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Data distribuição",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Vara",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Fórum",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Status",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Editar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                DataColumn(
                    label: Center(
                  child: Text("Excluir",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
              ],
            ),
          ),
        ],
      ),
      //Fim ListView
      //Inicio Menu Lateral
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 24, 18, 43),
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
                        fit: BoxFit.fill)),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
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
                  Navigator.pop(context);
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

class MyData2 extends DataTableSource {
  MyData2(this._data, this.context);

  final List<Data> _data;
  final BuildContext context;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Center(
          child: Text(
        _data[index].numeroProcesso ?? "N/A",
      ))),
      DataCell(Center(child: Text(_data[index].aberturaProcesso ?? "N/A"))),
      DataCell(Center(child: Text(_data[index].acao ?? "N/A"))),
      DataCell(Center(child: Text(_data[index].dataDistricuicao ?? "N/A"))),
      DataCell(Center(child: Text(_data[index].varaProcesso ?? "N/A"))),
      DataCell(Center(child: Text(_data[index].forumProcesso ?? "N/A"))),
      DataCell(Center(child: Text(_data[index].statusProcesso ?? "N/A"))),
      DataCell(Center(
          child: ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  "/editProcess",
                  arguments: {
                    "idProcesso": _data[index].idProcesso,
                    "numeroProcesso": _data[index].numeroProcesso,
                    "aberturaProcesso": _data[index].aberturaProcesso,
                    "acao": _data[index].acao,
                    "dataDistricuicao": _data[index].dataDistricuicao,
                    "varaProcesso": _data[index].varaProcesso,
                    "forumProcesso": _data[index].forumProcesso,
                    "statusProcesso": _data[index].statusProcesso,
                  },
                );
              },
              child: const Icon(Icons.edit)))),
      DataCell(Center(
          child: ElevatedButton(
              onPressed: () {
                openDialog(context, _data[index].idProcesso ?? "N/A",
                    _data[index].numeroProcesso ?? "N/A");
              },
              child: const Icon(Icons.delete)))),
    ]);
  }
}

class Data {
  String? idProcesso;
  String? acao;
  String? aberturaProcesso;
  String? dataDistricuicao;
  String? forumProcesso;
  String? numeroProcesso;
  String? statusProcesso;
  String? varaProcesso;

  Data({
    required this.idProcesso,
    required this.acao,
    required this.aberturaProcesso,
    required this.dataDistricuicao,
    required this.forumProcesso,
    required this.numeroProcesso,
    required this.statusProcesso,
    required this.varaProcesso,
  });
}

Future openDialog(
        BuildContext context, String idProcesso, String numerorProcesso) =>
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title:
                  Text("Tem certeza de excluir o processo n°$numerorProcesso?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    deleteProcesso(idProcesso);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AssistedProcessPage()));
                  },
                  child: const Text("Sim, tenho certeza"),
                ),
              ],
            ));

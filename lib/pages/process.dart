import 'package:flutter/material.dart';
import 'package:npj/components/side_menu.dart';


class AssistedPage extends StatelessWidget {
  const AssistedPage({Key? key});

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
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GPRO")),
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
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
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: "    Search",
                            suffixIcon: Icon(Icons.search),
                          ),
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
            Row(
              children: [
                Expanded(
                  child: PaginatedDataTable(
                    arrowHeadColor: const Color.fromARGB(255, 38, 29, 68),
                    showFirstLastButtons: true,
                    source: _data,
                    headingRowHeight: 40,
                    columns: const [
                      DataColumn(
                          label: Expanded(
                        child: Text("N° de processo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Aberto em",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Ação",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Data distribuição",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Vara",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Fórum",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Status",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //Fim ListView
      //Inicio Menu Lateral
      drawer: const SideMenu(),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "numeroProcesso": 10230 + index,
            "aberturaProcesso": "2023/09/20",
            "acao": 'XXXXXXXXXXX',
            "dataDistribuicao": "2023/11/05",
            "vara": "XXXXXXXXXXX",
            "forum": "XXXXXXXXXX",
            "status": "Ativo",
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Center(
          child: Text(
        _data[index]['numeroProcesso'].toString(),
      ))),
      DataCell(Center(
          child: Text(
        _data[index]['aberturaProcesso'].toString(),
      ))),
      DataCell(Center(
          child: Text(
        _data[index]['acao'].toString(),
      ))),
      DataCell(Center(
          child: Text(
        _data[index]['dataDistribuicao'].toString(),
      ))),
      DataCell(Center(
          child: Text(
        _data[index]['vara'].toString(),
      ))),
      DataCell(Center(
          child: Text(
        _data[index]['forum'].toString(),
      ))),
      DataCell(Center(
          child: Text(
        _data[index]['status'].toString(),
      ))),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}



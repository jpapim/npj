import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:npj/components/delete_process_alert.dart';
import 'package:npj/components/side_menu.dart';
import 'package:npj/components/user_menu.dart';
import 'package:npj/services/firebase_service.dart';

class AssistedProcessPage extends StatefulWidget {
  const AssistedProcessPage({Key? key}) : super(key: key);

  @override
  State<AssistedProcessPage> createState() => _AssistedProcessPageState();
}

class _AssistedProcessPageState extends State<AssistedProcessPage> {
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
      appBar: AppBar(
        title: const Text("GPRO"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: UserPopupMenu(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/addProcess');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          //Header com "PROCESSOS"
          Container(
            height: 50,
            color: const Color.fromARGB(255, 50, 39, 85),
            child: const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "PROCESSOS",
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
            height: 64,
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
      drawer: const SideMenu(),
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
                await Navigator.pushReplacementNamed(
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
            showDeleteConfirmationDialog(
              context,
              _data[index].idProcesso ?? "N/A",
              _data[index].numeroProcesso ?? "N/A",
              (String idProcesso) async {
                await deleteProcess(idProcesso);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processo excluído!'), duration: Duration(milliseconds: 2000),));
                Navigator.pushReplacementNamed(
                    context, '/process');
              },
            );
          },
          child: const Icon(Icons.delete),
        ),
      )),
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
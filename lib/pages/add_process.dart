import 'package:flutter/material.dart';
import 'package:npj/components/side_menu.dart';
import 'package:npj/pages/assisted_process.dart';
import 'package:npj/services/firebase_service.dart';


class AddProcessoPage extends StatelessWidget {
  const AddProcessoPage({super.key});

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
      home: const AddProcesso(title: appTitle),
    );
  }
}

class AddProcesso extends StatefulWidget {
  const AddProcesso({super.key, required this.title});

  final String title;

  @override
  State<AddProcesso> createState() => _AddProcessoState();
}

class _AddProcessoState extends State<AddProcesso> {
  TextEditingController numeroProcesso = TextEditingController();
  TextEditingController aberturaProcesso = TextEditingController();
  TextEditingController acao = TextEditingController();
  TextEditingController dataDistricuicao = TextEditingController();
  TextEditingController varaProcesso = TextEditingController();
  TextEditingController forumProcesso = TextEditingController();
  TextEditingController statusProcesso = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GPRO")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 15, bottom: 15),
              child: Column(
                children: [
                  //Inicio Ficha de Atendimento
                  const Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Adicionar Processo",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: numeroProcesso,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Numero do Processo",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: aberturaProcesso,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Abertura do Processo",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: acao,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Ação",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: dataDistricuicao,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Data de Distribuição",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: varaProcesso,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Vara",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: forumProcesso,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Forum",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: statusProcesso,
                          style: const TextStyle(fontSize: 22),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Status",
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 103, 22, 170),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal),
                            ),
                            onPressed: () async {
                              await addProcess(
                                      numeroProcesso.text,
                                      aberturaProcesso.text,
                                      acao.text,
                                      dataDistricuicao.text,
                                      varaProcesso.text,
                                      forumProcesso.text,
                                      statusProcesso.text)
                                  .then((value) {
                                // print("Cadastrador");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AssistedProcessPage()));
                              });
                            },
                            child: const Text('Cadastrar'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

      //Fim ListView
      //Inicio Menu Lateral
      drawer: const SideMenu(),
    );
  }
}

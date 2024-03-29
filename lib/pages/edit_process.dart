import 'package:flutter/material.dart';
import 'package:npj/components/side_menu.dart';
import 'package:npj/services/firebase_service.dart';

class EditProcessPage extends StatefulWidget {
  const EditProcessPage({super.key});

  @override
  State<EditProcessPage> createState() => _EditProcessPageState();
}

class _EditProcessPageState extends State<EditProcessPage> {
  TextEditingController idProcesso = TextEditingController();
  TextEditingController numeroProcesso = TextEditingController();
  TextEditingController aberturaProcesso = TextEditingController();
  TextEditingController acao = TextEditingController();
  TextEditingController dataDistricuicao = TextEditingController();
  TextEditingController varaProcesso = TextEditingController();
  TextEditingController forumProcesso = TextEditingController();
  TextEditingController statusProcesso = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  //TODO: inserir mais validações e encapsular elas em outro widget/classe para utillizar do add_process e no edit_process e validar cada campo

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    idProcesso.text = arguments['idProcesso'];
    numeroProcesso.text = arguments['numeroProcesso'];
    aberturaProcesso.text = arguments['aberturaProcesso'];
    acao.text = arguments['acao'];
    dataDistricuicao.text = arguments['dataDistricuicao'];
    varaProcesso.text = arguments['varaProcesso'];
    forumProcesso.text = arguments['forumProcesso'];
    statusProcesso.text = arguments['statusProcesso'];

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
                            "Editar Processo",
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
                          validator: (String? value){
                            if (valueValidator(value)){
                              return 'Insira o número do processo';
                            }
                            return null;
                          },
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
                          validator: (String? value){
                            if (valueValidator(value)){
                              return 'Insira a data da abertura do processo';
                            }
                            return null;
                          },
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
                              backgroundColor:
                                  const Color.fromARGB(255, 103, 22, 170),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await updateProcess(
                                        idProcesso.text,
                                        numeroProcesso.text,
                                        aberturaProcesso.text,
                                        acao.text,
                                        dataDistricuicao.text,
                                        varaProcesso.text,
                                        forumProcesso.text,
                                        statusProcesso.text)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processo salvo!')));
                                  Navigator.pushReplacementNamed(
                                      context, ('/process'));
                                });
                              }
                            },
                            child: const Text('Modificar'),
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

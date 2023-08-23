import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// função para salvar Processo no banco de dados
Future<void> addProcess(
    String numeroProcesso,
    String aberturaProcesso,
    String acao,
    String dataDistricuicao,
    String varaProcesso,
    String forumProcesso,
    String statusProcesso) async {
  await db.collection("processo").add({
    "aberturaProcesso": aberturaProcesso,
    "acao": acao,
    "dataDistricuicao": dataDistricuicao,
    "forumProcesso": forumProcesso,
    "numeroProcesso": numeroProcesso,
    "statusProcesso": statusProcesso,
    "varaProcesso": varaProcesso,
  });
}

//Atualizar Processo no banco de dados
Future<void> updateProcesso(
    String idProcesso,
    String numeroProcesso,
    String aberturaProcesso,
    String acao,
    String dataDistricuicao,
    String varaProcesso,
    String forumProcesso,
    String statusProcesso) async {
  await db.collection("processo").doc(idProcesso).set({
    "aberturaProcesso": aberturaProcesso,
    "acao": acao,
    "dataDistricuicao": dataDistricuicao,
    "forumProcesso": forumProcesso,
    "numeroProcesso": numeroProcesso,
    "statusProcesso": statusProcesso,
    "varaProcesso": varaProcesso,
  });
}

//Apagar Processo do banco de dados
Future<void> deleteProcesso(String idProcesso) async {
  await db.collection("processo").doc(idProcesso).delete();
}

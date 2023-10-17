import 'package:flutter/material.dart';

Future<void> showDeleteConfirmationDialog(
  BuildContext context,
  String idProcesso,
  String numeroProcesso,
  Function onDeleteConfirmed,
) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Tem certeza de excluir o processo n° $numeroProcesso?"),
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
              onDeleteConfirmed(idProcesso);
              Navigator.pop(context);
            },
            child: const Text("Sim, tenho certeza"),
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';

class UserPopupMenu extends StatelessWidget {
  const UserPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    void handleMenuSelection(String value) {
      if (value == 'login') {
        Navigator.pushNamed(context, '/login'); // Substitua '/login' pelo nome da rota da página de login.
      } else if (value == 'register') {
        Navigator.pushNamed(context, '/register'); // Substitua '/register' pelo nome da rota da página de registro.
      }
    }

    return PopupMenuButton<String>(
      onSelected: (value) {
        handleMenuSelection(value);
      },
      icon: const Icon(Icons.person), // Ícone de usuário
      offset: const Offset(0, 50), // Espaçamento para baixo
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'login',
            child: Text('Login'),
          ),
          const PopupMenuItem<String>(
            value: 'register',
            child: Text('Registrar'),
          ),
        ];
      },
    );
  }
}
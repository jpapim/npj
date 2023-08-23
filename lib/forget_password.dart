import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

// Linhas de código abaixo para conseguir captar o FirebaseAuthException
String parseFirebaseAuthExceptionMessage(
    {String plugin = "auth", required String? input}) {
  if (input == null) {
    return "unknown";
  }

  String regexPattern = r'(?<=\(' + plugin + r'/)(.*?)(?=\)\.)';
  RegExp regExp = RegExp(regexPattern);
  Match? match = regExp.firstMatch(input);
  if (match != null) {
    return match.group(0)!;
  }

  return "unknown";
}

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordPage({super.key});

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      emailController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Um email foi enviado solicitando alteração de senha')),
      );
    } on FirebaseAuthException catch (e) { 
      final code = parseFirebaseAuthExceptionMessage(input: e.message);

      if (code.toString() == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Email informado é inválido')),
          );
      }
      if (code.toString() == 'missing-email') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Email não foi informado')),
          );
      }
      if (code.toString() == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Esse email não foi registrado')),
          );
      }
    }catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: const AlignmentDirectional(0,
                  0), //PROTÓTIPO ==  alignment: const AlignmentDirectional(0.6, -1),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                    ),
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 35, right: 35, top: 10, bottom: 3),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 250,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "../assets/imagens/logoGPROBranco.png"),
                                    fit: BoxFit.fill)),
                            child: const Text(''),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Problemas para entrar?',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Insira o seu email de matrícula e enviaremos um link para você acessar a sua conta.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              //hintText: 'E-mail',
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 45),
                                backgroundColor:
                                    const Color.fromARGB(255, 50, 39, 85),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                )),
                            onPressed: () => _resetPassword(context),
                            child: const Text('Recuperar conta'),
                          ),
                          const SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Já tem uma conta?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text("Voltar ao login"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            // Fim formulario de login
            Container(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80),
                        Text("Sobre"),
                        SizedBox(width: 25),
                        Text("Privacidade"),
                        SizedBox(width: 25),
                        Text("Termo de uso"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("© 2023 GPRO"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

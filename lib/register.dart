import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:npj/login.dart';

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

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();

  RegisterPage({super.key});

  void _registerUser(BuildContext context) async {
    if (nameController.isNull || nameController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O campo nome não foi preenchido!')),
      );
    } else if (passwordController.isNull || passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O campo senha não foi preenchido!')),
      );
    } else if (matriculaController.isNull || matriculaController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O campo matrícula não foi preenchido!')),
      );
    } else if (matriculaController.text.length <= 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('O campo matrícula não foi preenchido corretamente!')),
      );
    } else if (emailController.text.contains("projecao.edu.br") == false ||
        emailController.text.length != 25) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'O email informado é inválido, certifique-se de informar o email da instituição')),
      );
    } else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        String userId = userCredential.user!.uid;
        DateTime now = DateTime.now();
        String dataFormatada = now.toLocal().toString();

        await FirebaseFirestore.instance
            .collection('Usuários')
            .doc(userId)
            .set({
          'Id': userId,
          'Nome': nameController.text,
          'Email': emailController.text,
          'Matrícula': matriculaController.text,
          'Registro em': dataFormatada,
        });

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Registro realizado com sucesso! = ${userCredential.user!.uid}')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        final code = parseFirebaseAuthExceptionMessage(input: e.message);

        if (code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Sua senha precisa de mais caracteres')),
          );
        } else if (code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'O email informado já está em uso, solicite a recuperação de senha caso necessário')),
          );
        } else if (code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('O email informado não é válido')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 125, top: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  '../assets/imagens/logo.jpg',
                  //fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Cadastre-se para acessar \ne gerenciar processos \njurídicos',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Nome completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: matriculaController,
                  decoration: const InputDecoration(
                    hintText: 'Matrícula',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  maxLength: 9,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Ao se cadastrar, você concorda com \nnossos Termos, Política de Privacidade e\n Política de Cookies.',
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 60, 52, 84)),
                  ),
                  onPressed: () => _registerUser(context),
                  child: const Text('Cadastre-se'),
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Já possui uma conta? ',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: 'Conecte-se',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

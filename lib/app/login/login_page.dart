import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailControler = TextEditingController();

  final passwordControler = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 173, 170, 170),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/mercedes.jpg'),
                  radius: 100,
                ),
                const SizedBox(height: 20),
                Text(isCreatingAccount == true
                    ? 'Zarejestruj się'
                    : 'Zaloguj się'),
                const SizedBox(height: 20),
                TextField(
                  controller: widget.emailControler,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                ),
                TextField(
                    controller: widget.passwordControler,
                    decoration: const InputDecoration(hintText: 'Hasło'),
                    obscureText: true),
                const SizedBox(height: 20),
                Text(errorMessage),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (isCreatingAccount == true) {
                      //rejestracja

                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: widget.emailControler.text,
                          password: widget.passwordControler.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    } else {
                      //logowanie
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: widget.emailControler.text,
                          password: widget.passwordControler.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 49, 47, 49)),
                  child: Text(isCreatingAccount == true
                      ? 'Zarejestruj się'
                      : 'Zaloguj się'),
                ),
                const SizedBox(height: 20),
                if (isCreatingAccount == false) ...[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 253, 253, 253),
                    ),
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    },
                    child: Text('Utwórz konto'),
                  ),
                ],
                if (isCreatingAccount == true) ...[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 253, 253, 253),
                    ),
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    },
                    child: Text('Masz już konto?'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

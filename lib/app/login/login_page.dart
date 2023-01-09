import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 173, 170, 170),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/mercedes.jpg'),
                radius: 100,
              ),
              const SizedBox(height: 20),
              const Text('Zaloguj się'),
              const SizedBox(height: 20),
              TextField(
                controller: emailControler,
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              TextField(
                  controller: passwordControler,
                  decoration: const InputDecoration(hintText: 'Hasło'),
                  obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailControler.text,
                      password: passwordControler.text,
                    );
                  } catch (error) {
                    print(error);
                  }
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailControler.text,
                      password: passwordControler.text);
                },
                child: const Text('Zaloguj się'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

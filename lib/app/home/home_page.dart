import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Jesteś zalogowany jako ${user.email}'),
      ),
      appBar: AppBar(
        title: const Text('Dziennik kierowcy'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 70, 70, 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 1, 209, 192),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user == null) {
            return const Scaffold(
              body: Center(
                child: Text('Jesteś nie zalogowany'),
              ),
            );
          }
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
        });
  }
}

class WorkWidget extends StatelessWidget {
  const WorkWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 146, 152, 156),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(15),
      child: Text(title),
    );
  }
}

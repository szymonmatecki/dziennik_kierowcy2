import 'package:flutter/material.dart';

void main() {
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
    return Scaffold(
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
      body: ListView(
        children: const [
          WorkWidget('Dzień pracy 1'),
          WorkWidget('Dzień pracy 2'),
          WorkWidget('Dzień pracy 3'),
          WorkWidget('Dzień pracy 4'),
          WorkWidget('Dzień pracy 5'),
          WorkWidget('Dzień pracy 6'),
          WorkWidget('Dzień pracy 7'),
        ],
      ),
    );
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

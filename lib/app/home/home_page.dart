import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 98, 98),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return Center(
            child: Text('Jeden'),
          );
        }
        if (currentIndex == 1) {
          return Center(
            child: Text('Dwa'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Wyloguj'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 209, 192),
                ),
              )
            ],
          ),
        );
      }),
      appBar: AppBar(
        title: const Text('Dziennik kierowcy'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 70, 70, 70),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 70, 70, 70),
        fixedColor: const Color.fromARGB(255, 1, 209, 192),
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Dzień pracy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}

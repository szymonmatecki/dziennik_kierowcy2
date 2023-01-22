import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_work/add_work_page_content.dart';
import 'my_account/my_account_page_content.dart';
import 'work_day/work_day_page_content.dart';

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
      backgroundColor: const Color.fromARGB(255, 99, 98, 98),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const WorkDayPageContent();
        }
        if (currentIndex == 1) {
          return const AddWorkDayContent();
        }
        return MyAccountPageContent(email: widget.user.email);
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
            icon: Icon(Icons.calendar_today),
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

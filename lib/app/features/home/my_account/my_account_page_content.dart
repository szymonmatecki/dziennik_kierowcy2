// ignore_for_file: sort_child_properties_last

import 'package:dziennik_kierowcy2/app/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jesteś zalogowany jako $email'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<RootCubit>().signOut();
              },
              child: const Text('Wyloguj'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 209, 192),
              ),
            )
          ],
        ),
      ),
    );
  }
}

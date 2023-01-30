// ignore_for_file: sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddWorkDayContent extends StatefulWidget {
  const AddWorkDayContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWorkDayContent> createState() => _AddWorkDayContentState();
}

class _AddWorkDayContentState extends State<AddWorkDayContent> {
  var day = '';
  var starttime = '';
  var stoptime = '';
  var startplace = '';
  var stopplace = '';
  var stopcounterstatus = '';
  var startcounterstatus = '';
  var totalkilometers = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Data rozpoczęcia',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      starttime = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj czas rozpoczęcia',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      starttime = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj czas zakończenia',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      stoptime = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj miejsce rozpoczęcia',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      startplace = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj miejsce zakończenia',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      stopplace = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj stan licznika przed rozpoczęciem jazdy',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      stopcounterstatus = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj stan licznika po zakończeniu jazdy ',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      startcounterstatus = newValue;
                    });
                  }),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Suma kilometrów',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      totalkilometers = newValue;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('workday').add({
                    'day': day,
                    'starttime': starttime,
                    'stoptime': stoptime,
                    'startplace': startplace,
                    'stopplace': stopplace,
                    'stopcounterstatus': stopcounterstatus,
                    'startcounterstatus': startcounterstatus,
                    'totalkilometers': totalkilometers,
                  });
                },
                child: const Text('Dodaj'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 209, 192),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

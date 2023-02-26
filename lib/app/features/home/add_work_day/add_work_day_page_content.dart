

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddWorkDayContent extends StatefulWidget {
  const AddWorkDayContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWorkDayContent> createState() => _AddWorkDayContentState();
}

final numberController = TextEditingController();
final numberController2 = TextEditingController();
final numberController3 = TextEditingController();
final dateController = TextEditingController();

class _AddWorkDayContentState extends State<AddWorkDayContent> {
  var day = '';
  var starttime = '';
  var stoptime = '';
  var startplace = '';
  var stopplace = '';
  var bordername = '';
  var stopcounterstatus = '';
  var startcounterstatus = '';
  var placeloadingunloading = '';
  var totalkilometers = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today_rounded),
                        hintText: 'Wybierz datę',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050));

                        if (pickeddate != null) {
                          setState(() {
                            dateController.text =
                                DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                      },
                      onChanged: (newValue) {
                        setState(() {
                          day = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Podaj czas rozpoczęcia/przybycia',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          starttime = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Podaj czas zakończenia/wyjazdu',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          stoptime = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Podaj miejsce rozpoczęcia',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          startplace = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Podaj miejsce zakończenia',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          stopplace = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Podaj nazwę przejścia granicznego',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          totalkilometers = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      controller: numberController,
                      decoration: const InputDecoration(
                        hintText:
                            'Podaj stan licznika przed rozpoczęciem jazdy',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (newValue) {
                        setState(() {
                          stopcounterstatus = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      controller: numberController2,
                      decoration: const InputDecoration(
                        hintText: 'Podaj stan licznika po zakończeniu jazdy ',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (newValue) {
                        setState(() {
                          startcounterstatus = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Miejsce załadunku/rozładunku',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          placeloadingunloading = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextField(
                      controller: numberController3,
                      decoration: const InputDecoration(
                        hintText: 'Suma kilometrów',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (newValue) {
                        setState(() {
                          totalkilometers = newValue;
                        });
                      }),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('workday').add({
                        'day': day,
                        'starttime': starttime,
                        'stoptime': stoptime,
                        'startplace': startplace,
                        'stopplace': stopplace,
                        'bordername': bordername,
                        'stopcounterstatus': stopcounterstatus,
                        'startcounterstatus': startcounterstatus,
                        'placeloadingunloading': placeloadingunloading,
                        'totalkilometers': totalkilometers,
                      });
                    },
                    child:  const Text('Dodaj'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 209, 192),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

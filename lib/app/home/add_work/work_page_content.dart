import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dziennik_kierowcy2/app/home/work_day/add_work_day_page_content.dart';
import 'package:flutter/material.dart';

class WorkDayPageContent extends StatelessWidget {
  const WorkDayPageContent({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('workday')
            .orderBy('day')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading'));
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddWorkDayContent(),
                      ),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 120,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(31, 12, 9, 9),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 5, color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            document['day'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['starttime'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['stoptime'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['startplace'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['stopplace'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['bordername'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['stopcounterstatus'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['startcounterstatus'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['placeloadingunloading'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            document['totalkilometers'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class WorkDayPageContent extends StatelessWidget {
  const WorkDayPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('workday').snapshots(),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(document['Godzina rozpoczęcia'].toString()),
                      Text(document['Godzina zakończenia'].toString()),
                      Text(document['Miejsce rozpoczęcia']),
                      Text(document['Miejsce zakończenia']),
                      Text(document['Stan licznika końcowy'].toString()),
                      Text(document['Stan licznika początkowy'].toString()),
                      Text(document['Suma kilometrów'].toString()),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}

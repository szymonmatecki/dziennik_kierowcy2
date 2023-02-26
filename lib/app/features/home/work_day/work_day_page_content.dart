import 'package:dziennik_kierowcy2/app/features/home/work_day/cubit/work_day_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_work_day/add_work_day_page_content.dart';

class WorkDayPageContent extends StatelessWidget {
  const WorkDayPageContent({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkDayCubit()..start(),
      child: BlocBuilder<WorkDayCubit, WorkDayState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage}',
              ),
            );
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          final documents = state.documents;

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
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['starttime'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['stoptime'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['startplace'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['stopplace'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['bordername'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['stopcounterstatus'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['startcounterstatus'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['placeloadingunloading'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            document['totalkilometers'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

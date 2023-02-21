import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'work_day_state.dart';

class WorkDayCubit extends Cubit<WorkDayState> {
  WorkDayCubit()
      : super(
          const WorkDayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubsciption;

  Future<void> start() async {
    emit(
      const WorkDayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubsciption = FirebaseFirestore.instance
        .collection('workday')
        .orderBy('day')
        .snapshots()
        .listen((data) {
      emit(
        WorkDayState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          WorkDayState(
            documents: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubsciption?.cancel();
    return super.close();
  }
}

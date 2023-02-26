part of 'work_day_cubit.dart';

@immutable
class WorkDayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const WorkDayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

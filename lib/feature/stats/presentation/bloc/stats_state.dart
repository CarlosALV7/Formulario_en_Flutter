part of 'stats_bloc.dart';

@immutable
abstract class StatsState {}

class StatsInitial extends StatsState {}

class StatsLoadInProgress extends StatsState {}

/// Contains the data for the graph and displaying stats
///   - student report
///   - grades
///   - subjects
///   - absences
class StatsLoadSuccess extends StatsState {
  final StudentReport studentReport;

  StatsLoadSuccess({@required this.studentReport});
}

class StatsLoadError extends StatsState {}

class StatsUpdateLoadInProgress extends StatsState {}

class StatsUpdateLoadSuccess extends StatsState {}

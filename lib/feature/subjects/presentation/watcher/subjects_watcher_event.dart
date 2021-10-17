part of 'subjects_watcher_bloc.dart';

@immutable
abstract class SubjectsWatcherEvent {}

class SubjectsReceived extends SubjectsWatcherEvent {
  final Resource<List<SubjectDomainModel>> resource;

  SubjectsReceived({
    @required this.resource,
  });
}

class SubjectsStartWatcherIfNeeded extends SubjectsWatcherEvent {}

class SubjectsRestartWatcher extends SubjectsWatcherEvent {}

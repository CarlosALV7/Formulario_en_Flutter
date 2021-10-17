import 'package:moor/moor.dart';

@DataClassName('LessonLocalModel')
class Lessons extends Table {
  IntColumn get eventId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get code => text()();
  IntColumn get position => integer()();
  IntColumn get duration => integer()();
  TextColumn get classe => text()();
  TextColumn get author => text()();
  IntColumn get subjectId => integer()();
  TextColumn get subjectCode => text()();
  TextColumn get subjectDescription => text()();
  TextColumn get lessonType => text()();
  TextColumn get lessonArg => text()();

  @override
  Set<Column> get primaryKey => {eventId};
}

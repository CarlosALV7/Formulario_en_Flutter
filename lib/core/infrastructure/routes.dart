import 'package:registro_elettronico/feature/absences/presentation/absences_page.dart';
import 'package:registro_elettronico/feature/agenda/presentation/agenda_page.dart';
import 'package:registro_elettronico/feature/authentication/presentation/login_page.dart';
import 'package:registro_elettronico/feature/didactics/presentation/didactics_page.dart';
import 'package:registro_elettronico/feature/navigator/navigator_page.dart';
import 'package:registro_elettronico/feature/notes/presentation/notes_page.dart';
import 'package:registro_elettronico/feature/noticeboard/presentation/noticeboard_page.dart';
import 'package:registro_elettronico/feature/scrutini/presentation/scrutini_page.dart';
import 'package:registro_elettronico/feature/settings/settings_page.dart';
import 'package:registro_elettronico/feature/splash/presentation/splash_screen.dart';
import 'package:registro_elettronico/feature/stats/presentation/stats_page.dart';
import 'package:registro_elettronico/feature/subjects/presentation/subjects_page.dart';
import 'package:registro_elettronico/feature/timetable/presentation/timetable_page.dart';

class Routes {
  static const MAIN = '/';
  static const NAVIGATOR = '/navigator';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const LESSONS = '/lessons';
  static const GRADES = '/grades';
  static const AGENDA = '/agenda';
  static const ABSENCES = '/absences';
  static const SCHOOL_MATERIAL = '/school-material';
  static const NOTES = '/notes';
  static const NOTICEBOARD = '/noticeboard';
  static const TIMETABLE = '/timetable';
  static const SCRUTINI = '/scrutini';
  static const STATS = '/stats';
  static const WEB_VIEW = '/web-view';
  static const SETTINGS = '/settings';

  static var routes = {
    MAIN: (ctx) => SplashScreen(),
    LOGIN: (ctx) => LoginPage(),
    HOME: (ctx) => NavigatorPage(),
    LESSONS: (ctx) => SubjectsPage(),
    AGENDA: (ctx) => AgendaPage(),
    ABSENCES: (ctx) => AbsencesPage(),
    NOTES: (ctx) => NotesPage(),
    SCHOOL_MATERIAL: (ctx) => DidacticsPage(),
    NOTICEBOARD: (ctx) => NoticeboardPage(),
    TIMETABLE: (ctx) => TimetablePage(),
    SCRUTINI: (ctx) => ScrutiniPage(),
    STATS: (ctx) => StatsPage(),
    SETTINGS: (ctx) => SettingsPage(),
    NAVIGATOR: (ctx) => NavigatorPage()
  };
}

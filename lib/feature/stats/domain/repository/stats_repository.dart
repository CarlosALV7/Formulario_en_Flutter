import 'package:dartz/dartz.dart';
import 'package:registro_elettronico/core/infrastructure/error/failures.dart';
import 'package:registro_elettronico/feature/stats/data/model/student_report.dart';

abstract class StatsRepository {
  Future<Either<Failure, StudentReport>> getStudentReport();
}

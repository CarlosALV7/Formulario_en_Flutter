import 'package:flutter/material.dart' show Color;
import 'package:moor/moor.dart';
import 'package:registro_elettronico/core/data/local/moor_database.dart';
import 'package:registro_elettronico/feature/agenda/data/model/agenda_event_remote_model.dart';
import 'package:registro_elettronico/utils/global_utils.dart';

@DataClassName('AgendaEventLocalModel')
class AgendaEventsTable extends Table {
  IntColumn get evtId => integer()();
  TextColumn get evtCode => text()();
  DateTimeColumn get begin => dateTime()();
  DateTimeColumn get end => dateTime()();
  BoolColumn get isFullDay => boolean()();
  TextColumn get notes => text()();
  TextColumn get authorName => text()();
  TextColumn get classDesc => text()();
  IntColumn get subjectId => integer()();
  TextColumn get subjectDesc => text()();
  BoolColumn get isLocal => boolean()();
  TextColumn get labelColor => text()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {evtId};

  @override
  String get tableName => 'agenda_events';
}

class AgendaEventLocalModelConverter {
  static AgendaEventLocalModel fromRemoteModel(
    AgendaEventRemoteModel r,
    AgendaEventLocalModel l,
    Color color,
  ) {
    return AgendaEventLocalModel(
      evtId: r.evtId ?? -1,
      evtCode: r.evtCode ?? '',
      begin: DateTime.tryParse(r.evtDatetimeBegin) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      end: DateTime.tryParse(r.evtDatetimeEnd) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      isFullDay: r.isFullDay ?? false,
      notes: r.notes ?? '',
      authorName: r.authorName ?? '',
      classDesc: r.classDesc ?? '',
      subjectId: r.subjectId ?? 0,
      subjectDesc: r.subjectDesc ?? '',
      isLocal: l != null ? l.isLocal : false,
      labelColor: (l != null && l.labelColor != null)
          ? l.labelColor
          : GlobalUtils.getColorCode(color),
      title: l != null ? l.title : '',
    );
  }
}

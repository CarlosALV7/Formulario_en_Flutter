import 'package:flutter/material.dart';
import 'package:registro_elettronico/core/infrastructure/app_injection.dart';
import 'package:registro_elettronico/core/infrastructure/localizations/app_localizations.dart';
import 'package:registro_elettronico/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:registro_elettronico/utils/date_utils.dart';
import 'package:registro_elettronico/utils/global_utils.dart';

import 'model/timetable_entry_presentation_model.dart';

/// A simple [Widget] for displaying a [BasicEvent].
class TimetableEventWidget extends StatelessWidget {
  const TimetableEventWidget(
    this.event, {
    Key key,
  })  : assert(event != null),
        super(key: key);

  /// The [BasicEvent] to be displayed.
  final TimetableEntryPresentationModel event;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.75,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      color: event.color,
      child: InkWell(
        onTap: () {
          print(event.toString());
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(event.subjectName),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      DateUtils.convertSingleDayForDisplay(
                        event.start.toDateTimeLocal(),
                        AppLocalizations.of(context).locale.toString(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text(
                      '${event.start.hourOfDay}:00-${event.end.hourOfDay}:00',
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    final TimetableRepository timetableRepository = sl();
                    await timetableRepository.deleteTimetableEntry(
                      id: event.id,
                    );

                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)
                      .translate('delete')
                      .toUpperCase()),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)
                      .translate('ok')
                      .toUpperCase()),
                )
              ],
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            GlobalUtils.reduceSubjectGridTitle(event.subjectName),
          ),
        ),
      ),
    );
  }
}

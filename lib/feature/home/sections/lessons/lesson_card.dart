import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:registro_elettronico/core/infrastructure/localizations/app_localizations.dart';
import 'package:registro_elettronico/feature/lessons/domain/model/lesson_domain_model.dart';
import 'package:registro_elettronico/utils/color_utils.dart';
import 'package:registro_elettronico/utils/date_utils.dart';
import 'package:registro_elettronico/utils/global_utils.dart';
import 'package:registro_elettronico/utils/string_utils.dart';

class LessonCard extends StatelessWidget {
  final LessonDomainModel lesson;
  final int position;
  final int duration;

  const LessonCard({
    Key key,
    @required this.lesson,
    @required this.position,
    @required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trans = AppLocalizations.of(context);
    double _paddingLeft = 0;
    if (position == 0) {
      _paddingLeft = 16.0;
    }
    return Padding(
      padding: EdgeInsets.only(left: _paddingLeft, right: 8.0),
      child: InkWell(
        onLongPress: () {
          final trans = AppLocalizations.of(context);

          String message = '';

          message +=
              '${trans.translate('author')}: ${StringUtils.titleCase(lesson.author)}';
          message +=
              '\n${trans.translate('date')}: ${DateUtils.convertDateForLessons(lesson.date)}';
          message += '\n${lesson.lessonArgoment}';

          Share.text(AppLocalizations.of(context).translate('share'), message,
              'text/plain');
        },
        onTap: () {
          showDialog(
            context: context,
            builder: (bCtx) => AlertDialog(
              title: Text(
                lesson.subjectDescription,
                style: TextStyle(fontSize: 15),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SelectableText(
                      """${trans.translate('author')}: ${StringUtils.titleCase(lesson.author)}
                      \n${trans.translate('argument')}: ${lesson.lessonArgoment}
                      \n${trans.translate('date')}: ${DateUtils.convertDateLocale(lesson.date, AppLocalizations.of(context).locale.toString())}
                      \n${trans.translate('type')}: ${lesson.lessonType}"""),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(AppLocalizations.of(context).translate('ok')),
                  onPressed: () => Navigator.of(bCtx).pop(),
                )
              ],
            ),
          );
        },
        child: Container(
          width: 220.0,
          height: 140,
          decoration: BoxDecoration(
            color: ColorUtils.getLessonCardColor(context),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                          width: 40.0,
                          height: 40.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(color: Colors.white),
                          child: GlobalUtils.getIconFromSubject(
                              lesson.subjectDescription)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200].withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8)),
                          child: Opacity(
                            opacity: 0.85,
                            child: Text(
                              '${duration ?? 1}H',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        lesson.subjectDescription.length > 20
                            ? GlobalUtils.reduceSubjectTitle(
                                lesson.subjectDescription)
                            : lesson.subjectDescription,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Text(
                      lesson.lessonArgoment.length > 25
                          ? GlobalUtils.reduceLessonArgument(
                              lesson.lessonArgoment)
                          : lesson.lessonArgoment,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

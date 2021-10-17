import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registro_elettronico/core/data/local/moor_database.dart';
import 'package:registro_elettronico/core/infrastructure/app_injection.dart';
import 'package:registro_elettronico/core/infrastructure/localizations/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../header_text.dart';

class AccountSettings extends StatefulWidget {
  AccountSettings({Key key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0),
          child: HeaderText(
            text: AppLocalizations.of(context).translate('account'),
          ),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context).translate('reset_data')),
          subtitle: Text(
              AppLocalizations.of(context).translate('reset_data_message')),
          onTap: () {
            showDialog(context: context, builder: (context) => ResetDialog());
          },
        )
      ],
    );
  }
}

class ResetDialog extends StatelessWidget {
  const ResetDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).translate('reset_db_alert')),
      content: Text(
        AppLocalizations.of(context).translate('reset_db_alert_message'),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(AppLocalizations.of(context).translate('no')),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(AppLocalizations.of(context).translate('yes')),
          onPressed: () async {
            Navigator.pop(context);

            final SRDatabase srDatabase = sl();
            // ignore: unawaited_futures
            await srDatabase.resetDbWithoutProfile();

            final SharedPreferences sharedPreferences = sl();
            await sharedPreferences.clear();

            const platform = MethodChannel(
                'com.riccardocalligaro.registro_elettronico/multi-account');
            return platform.invokeMethod('restartApp');

            // ignore: unawaited_futures
            // UpdateUtils.updateAllData(fromLogin: true);
          },
        )
      ],
    );
  }
}

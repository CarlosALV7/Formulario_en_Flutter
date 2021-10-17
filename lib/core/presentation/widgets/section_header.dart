import 'package:flutter/material.dart';
import 'package:registro_elettronico/core/infrastructure/localizations/app_localizations.dart';

class SectionHeader extends StatelessWidget {
  final String headingText;
  final GestureTapCallback onTap;

  const SectionHeader({Key key, this.headingText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            headingText,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onTap != null
              ? FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: onTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: Text(
                      AppLocalizations.of(context).translate('view_all'),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 12),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

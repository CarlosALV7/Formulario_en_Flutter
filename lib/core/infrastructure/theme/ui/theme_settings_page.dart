import 'package:flutter/material.dart';

class ThemeSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      // body: ListView.builder(
      //   itemCount: AppTheme.values.length,
      //   itemBuilder: (ctx, index) {
      //     final theme = AppTheme.values.elementAt(index);
      //     return ThemeItem(
      //       theme: theme,
      //       themeData: materialThemeData[theme],
      //       onTap: () => BlocProvider.of<ThemeBloc>(context).add(
      //         ThemeChanged(theme: theme),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

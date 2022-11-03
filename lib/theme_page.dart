import 'package:flutter/material.dart';
import 'generated/l10n.dart';
class MyThemePage extends StatelessWidget {
  const MyThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber, brightness: Brightness.dark),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      highContrastTheme: ThemeData(primaryColor: Colors.redAccent),
      localizationsDelegates: const [
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Scaffold(
        body: Center(
          child: Builder(builder: (BuildContext context)=>Text(S.of(context).hello))
        ),
      ),
    );
  }
}

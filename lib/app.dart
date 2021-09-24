import 'package:clean/presentation/pages/authentication/register_page.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/authentication/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neo Store',
      theme: ThemeData(
        primaryColor: Color(0xff9e0100),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white,
          selectionHandleColor: Colors.white,
        ),
      ),
      home: RegisterPage(),
    );
  }
}
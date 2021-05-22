import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begins/pages/homepage.dart';
import 'package:flutter_begins/pages/login_page.dart';
import 'package:flutter_begins/utils/routes.dart';
import 'package:flutter_begins/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    return MaterialApp(
      // Removing the DEBUG tag from the App
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        // Root Route
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:translator_app/screens/home_screen/homescreen.dart';
import 'package:translator_app/widgets/themeservices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themeservices.themelight,
      themeMode: ThemeMode.system,
      home: MyHomeScreen(),
    );
  }
}

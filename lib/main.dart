import 'package:flutter/material.dart';
import 'package:todoapp/pages/home_page.dart';

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
      home: HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light, 
          primary: Colors.yellow[600]!, 
          onPrimary: Colors.yellow, 
          secondary: Colors.amber[600]!, 
          onSecondary: Colors.black, 
          error: Colors.red[700]!, 
          onError: Colors.white, 
          surface: Color(0xFFFEF293), 
          onSurface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        )
      ),
    );
  }
}


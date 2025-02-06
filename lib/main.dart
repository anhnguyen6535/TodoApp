import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

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

      home: HomePage(),

      // routes: {
      //   '/housechores'
      // },
    );
  }
}


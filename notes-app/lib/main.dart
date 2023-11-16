import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    return MaterialApp(
      theme: ThemeData(
        brightness: systemBrightness == Brightness.dark ? Brightness.dark : Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white
          )
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green, // Set the background color of the FAB
          foregroundColor: Colors.white, // Set the icon/text color of the FAB
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Set the shape of the FAB
          ),

        ),
        appBarTheme: AppBarTheme(
          color: systemBrightness == Brightness.light ? Colors.transparent : null,
          iconTheme: IconThemeData(
            color: systemBrightness == Brightness.light ? Colors.black : null, // Set the icon color to a contrasting color
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

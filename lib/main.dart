import 'package:flutter/material.dart';
import 'package:proyek_akhir_dicoding/views/home.dart';

const setColor = Color.fromARGB(255, 57, 167, 225);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GiGalaxy",
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: ThemeData(fontFamily: 'Nexa'),
    );
  }
}

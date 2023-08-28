import 'package:flutter/material.dart';
import 'package:json_reader/mainScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Excel to Json to flutter conversion",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const mainScreen(),
    );
  }
}

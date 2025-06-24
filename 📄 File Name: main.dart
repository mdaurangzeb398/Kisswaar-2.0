// main.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const KisswaarApp());
}

class KisswaarApp extends StatelessWidget {
  const KisswaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisswaar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

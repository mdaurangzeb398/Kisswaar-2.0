// File: lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(const KisswaarApp());

class KisswaarApp extends StatelessWidget {
  const KisswaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisswaar 💘',
      home: Scaffold(
        appBar: AppBar(title: const Text('Kisswaar 💘')),
        body: const Center(
          child: Text(
            'Welcome to Kisswaar!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

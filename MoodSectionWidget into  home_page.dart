import 'package:flutter/material.dart';
import '../widgets/mood_section_widget.dart';
import '../data/dummy_products.dart'; // where `productList` is defined

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kisswaar Mood Feed")),
      body: MoodSectionWidget(products: productList),
    );
  }
}

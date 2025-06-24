// mood_animated_feed.dart
import 'package:flutter/material.dart';

class MoodAnimatedFeed extends StatelessWidget {
  final String mood;
  final List<Widget> productWidgets;

  const MoodAnimatedFeed({
    required this.mood,
    required this.productWidgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    String headline = 'Welcome Back!';

    switch (mood) {
      case 'happy':
        bgColor = Colors.yellow.shade100;
        headline = 'You seem happy 😊 Here’s what you’ll love!';
        break;
      case 'sad':
        bgColor = Colors.blue.shade50;
        headline = 'Feeling down? Treat yourself ❤️';
        break;
      case 'romantic':
        bgColor = Colors.pink.shade50;
        headline = 'Romantic vibes? Let’s shop something beautiful 💖';
        break;
      case 'bored':
        bgColor = Colors.grey.shade200;
        headline = 'Let’s cure boredom with surprises 🎁';
        break;
      case 'angry':
        bgColor = Colors.red.shade100;
        headline = 'Take a breather. Try these calming picks 🧘';
        break;
    }

    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(headline, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: productWidgets,
            ),
          ),
        ],
      ),
    );
  }
}

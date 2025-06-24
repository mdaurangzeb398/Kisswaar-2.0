// profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String preferredMood;
  final String language;

  const ProfilePage({
    super.key,
    required this.userName,
    required this.preferredMood,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 40, child: Text(userName[0].toUpperCase(), style: const TextStyle(fontSize: 32))),
            const SizedBox(height: 16),
            Text(userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('🌈 Mood Preference:'), Text(preferredMood),
            ]),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('🌐 Language:'), Text(language),
            ]),
            const SizedBox(height: 24),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('My Wishlist'),
              onTap: () {
                debugPrint('🛍️ Navigate to wishlist screen');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Order History'),
              onTap: () {
                debugPrint('📦 Navigate to order history');
              },
            ),
          ],
        ),
      ),
    );
  }
}

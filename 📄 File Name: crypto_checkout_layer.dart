// crypto_checkout_layer.dart
import 'package:flutter/material.dart';

class CryptoCheckoutLayer extends StatelessWidget {
  final double amount;
  final Function(String) onCryptoSelected;

  const CryptoCheckoutLayer({
    required this.amount,
    required this.onCryptoSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> cryptoOptions = ['Bitcoin', 'Ethereum', 'USDT'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Amount: ₹$amount', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const Text('Choose Cryptocurrency:'),
            for (final coin in cryptoOptions)
              ListTile(
                title: Text(coin),
                leading: const Icon(Icons.currency_bitcoin),
                onTap: () => onCryptoSelected(coin),
              ),
            const SizedBox(height: 40),
            const Text(
              '⚠ This is a demo screen.\nTransaction simulation only.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

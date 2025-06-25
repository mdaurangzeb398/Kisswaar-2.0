// 📄 lib/controllers/kisswaar_payment_manager.dart

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';

class KisswaarPaymentManager {
  final Razorpay _razorpay = Razorpay();

  void init() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handleError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }

  void payNow({required int amount, required String name, required String contact, required String email}) {
    var options = {
      'key': 'rzp_test_XXXXXXX', // Replace with your key
      'amount': amount * 100,
      'name': 'Kisswaar',
      'description': name,
      'prefill': {'contact': contact, 'email': email}
    };
    _razorpay.open(options);
  }

  void _handleSuccess(PaymentSuccessResponse res) {
    debugPrint('✅ KisswaarPay Success: ${res.paymentId}');
    // redirect to receipt
  }

  void _handleError(PaymentFailureResponse res) {
    debugPrint('❌ KisswaarPay Failed: ${res.code} - ${res.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse res) {
    debugPrint('🔄 External Wallet Used: ${res.walletName}');
  }
}

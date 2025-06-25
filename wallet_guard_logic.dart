class WalletGuardLogic {
  static bool isEligibleForWithdrawal(UserWallet wallet) {
    // Total wallet balance must be from verified source
    return wallet.transactions.every((txn) =>
      txn.source == 'RETURN' || txn.source == 'CASHBACK');
  }

  static double getWithdrawableAmount(UserWallet wallet) {
    return wallet.transactions
        .where((txn) =>
            txn.source == 'RETURN' || txn.source == 'CASHBACK')
        .fold(0.0, (sum, txn) => sum + txn.amount);
  }
}

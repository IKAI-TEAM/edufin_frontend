class Transaction {
  final int amount;
  final String type, description;

  Transaction({
    required this.type,
    required this.description,
    required this.amount,
  });
}

List<Transaction> demoTransaction = [
  Transaction(
    type: 'Cash In',
    description: 'BCA - 1728784924',
    amount: 1000000,
  ),
  Transaction(
    type: 'Tokopedia',
    description: 'Payment',
    amount: 500000,
  ),
  Transaction(
    type: 'E-Kantin',
    description: 'Top-up E-Kantin Wallet',
    amount: 1500000,
  ),
];

List<List<Transaction>> transactionDay = [
  [
    Transaction(
      type: 'Cash In',
      description: 'BCA - 1728784924',
      amount: 1000000,
    ),
    Transaction(
      type: 'Tokopedia',
      description: 'Payment',
      amount: 500000,
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
    ),
  ],
  [
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 100000,
    ),
    Transaction(
      type: 'Cash In',
      description: 'BCA - 1728784924',
      amount: 1000000,
    ),
    Transaction(
      type: 'Tokopedia',
      description: 'Payment',
      amount: 500000,
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
    ),
  ],
  [
    Transaction(
      type: 'Cash Out',
      description: 'Mandiri - 2974014425',
      amount: 1000000,
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 500000,
    ),
    Transaction(
      type: 'Tokopedia',
      description: 'Payment',
      amount: 500000,
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
    ),
  ],
];

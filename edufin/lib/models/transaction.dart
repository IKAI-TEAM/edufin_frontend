class Transaction {
  final int amount;
  final String type, description, date, time;

  Transaction({
    required this.type,
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
  });
}

List<Transaction> demoTransaction = [
  Transaction(
    type: 'Cash In',
    description: 'BCA - 1728784924',
    amount: 1000000,
    date: 'April, 12 2023',
    time: '04.20 AM',
  ),
  Transaction(
    type: 'Tokopedia',
    description: 'Payment',
    amount: 500000,
    date: 'April, 12 2023',
    time: '04.20 AM',
  ),
  Transaction(
    type: 'E-Kantin',
    description: 'Top-up E-Kantin Wallet',
    amount: 1500000,
    date: 'April, 12 2023',
    time: '04.20 AM',
  ),
];

List<List<Transaction>> transactionDay = [
  [
    Transaction(
      type: 'Cash In',
      description: 'BCA - 1728784924',
      amount: 1000000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'Tokopedia',
      description: 'Payment',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
  ],
  [
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 100000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'Cash In',
      description: 'BCA - 1728784924',
      amount: 1000000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'Tokopedia',
      description: 'Payment',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
  ],
  [
    Transaction(
      type: 'Cash Out',
      description: 'Mandiri - 2974014425',
      amount: 1000000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'Tokopedia',
      description: 'Payment',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      type: 'E-Kantin',
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
  ],
];

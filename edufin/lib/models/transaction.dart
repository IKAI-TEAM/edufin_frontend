import 'dart:math';

class Transaction {
  final int amount;
  final String transactionId, merchantName;
  final String? description, date, time, type;

//     amount: 500000,
//     date: 'April, 12 2023',
//     time: '04.20 AM',
  // [log] {_id: 647de21d1b1cd47c52ea813e, cardId: CIIMFchPsmMO, amount: 1000, merchant: {name: Warung Kopi}}


  Transaction({
    required this.transactionId,
    required this.merchantName,
    required this.amount,
    this.description,
    this.date,
    this.time,
    this.type
  });
}

Random random = Random();

List<Transaction> demoTransaction = [
  Transaction(
    transactionId: generateRandomText(6),
    merchantName: generateRandomText(6),
    description: 'BCA - 1728784924',
    amount: 1000000,
    date: 'April, 12 2023',
    time: '04.20 AM',
  ),
  Transaction(
    transactionId: generateRandomText(6),
    merchantName: generateRandomText(6),
    description: 'Payment',
    amount: 500000,
    date: 'April, 12 2023',
    time: '04.20 AM',
  ),
  Transaction(
    transactionId: generateRandomText(6),
    merchantName: generateRandomText(6),
    description: 'Top-up E-Kantin Wallet',
    amount: 1500000,
    date: 'April, 12 2023',
    time: '04.20 AM',
  ),
];

List<List<Transaction>> transactionDay = [
  [
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'BCA - 1728784924',
      amount: 1000000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Payment',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
  ],
  [
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Top-up E-Kantin Wallet',
      amount: 100000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'BCA - 1728784924',
      amount: 1000000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Payment',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
  ],
  [
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Mandiri - 2974014425',
      amount: 1000000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Top-up E-Kantin Wallet',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Payment',
      amount: 500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
    Transaction(
      transactionId: generateRandomText(6),
      merchantName: generateRandomText(6),
      description: 'Top-up E-Kantin Wallet',
      amount: 1500000,
      date: 'April, 12 2023',
      time: '04.20 AM',
    ),
  ],
];

String generateRandomText(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}
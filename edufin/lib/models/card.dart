class MyCard {
  final int balance, expiryMonth, expiryYear, cardNum;

  MyCard({
    required this.cardNum,
    required this.balance,
    required this.expiryYear,
    required this.expiryMonth,
  });
}

List<MyCard> demoCard = [
  MyCard(
    cardNum: 0687,
    balance: 1000000,
    expiryMonth: 07,
    expiryYear: 09,
  ),
  MyCard(
    cardNum: 8482,
    balance: 1500000,
    expiryMonth: 22,
    expiryYear: 06,
  ),
  MyCard(
    cardNum: 9284,
    balance: 500000,
    expiryMonth: 07,
    expiryYear: 22,
  ),
];

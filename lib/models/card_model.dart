import 'package:faker/faker.dart';

class CardModel {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String cvv;
  bool isFrozen;

  CardModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
    this.isFrozen = false,
  });

  factory CardModel.fake() {
    final faker = Faker();
    return CardModel(
      cardNumber: faker.randomGenerator.fromPattern(['####-####-####-####']),
      cardHolder: faker.person.name().toUpperCase(),
      expiryDate:
          '${faker.randomGenerator.integer(12, min: 1).toString().padLeft(2, '0')}/${faker.randomGenerator.integer(30, min: 25).toString().padLeft(2, '0')}',
      cvv: faker.randomGenerator.fromPattern(['###']),
    );
  }
}
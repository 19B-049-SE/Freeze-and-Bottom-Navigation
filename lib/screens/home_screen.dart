import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../widgets/credit_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool isCardFrozen = false;
  late CardModel card;

  @override
  void initState() {
    super.initState();
    card = CardModel.fake();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CreditCard(
              cardNumber: card.cardNumber,
              cardHolder: card.cardHolder,
              expiryDate: card.expiryDate,
              isFrozen: isCardFrozen,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isCardFrozen = !isCardFrozen;
                });
              },
              icon: Icon(isCardFrozen ? Icons.lock_open : Icons.lock),
              label: Text(isCardFrozen ? 'Unfreeze Card' : 'Freeze Card'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isCardFrozen ? Colors.green : Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNav({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Projects'),
        BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Collect'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_separator.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  final walletData = {
    'address': '0x742d35Cc6634C0532925a3b8D4C0532925a3b8D4',
    'balance': 2815,
    'totalEarned': 3250,
    'totalTransferred': 435,
  };

  final transactions = [
    {
      'id': 1,
      'type': 'minted',
      'amount': 940,
      'project': 'Sundarbans Mangrove Restoration',
      'date': '2024-01-15',
      'hash': '0x1234...5678',
      'status': 'completed',
    },
    {
      'id': 2,
      'type': 'minted',
      'amount': 1875,
      'project': 'Bhitarkanika Blue Carbon',
      'date': '2024-01-10',
      'hash': '0x2345...6789',
      'status': 'completed',
    },
    {
      'id': 3,
      'type': 'transferred',
      'amount': -200,
      'recipient': 'EcoTech Solutions',
      'date': '2024-01-08',
      'hash': '0x3456...7890',
      'status': 'completed',
    },
    {
      'id': 4,
      'type': 'transferred',
      'amount': -235,
      'recipient': 'Green Future Corp',
      'date': '2024-01-05',
      'hash': '0x4567...8901',
      'status': 'completed',
    },
  ];

  final coBenefitNFTs = [
    {
      'id': 1,
      'title': 'Verified Mangrove Species Return',
      'project': 'Sundarbans Restoration',
      'mintDate': '2024-01-12',
      'tokenId': '#001',
    },
    {
      'id': 2,
      'title': 'Thriving Local Fisheries',
      'project': 'Bhitarkanika Blue Carbon',
      'mintDate': '2024-01-08',
      'tokenId': '#002',
    },
  ];

  bool showTransferDialog = false;
  bool showNFTDialog = false;

  void copyAddress() {
    // Clipboard logic (stub)
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Address copied to clipboard!')));
  }

  String formatAddress(String address) {
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }

  Icon getTransactionIcon(String type) {
    switch (type) {
      case 'minted':
        return const Icon(Icons.emoji_events, color: Colors.green, size: 18);
      case 'transferred':
        return const Icon(Icons.arrow_upward, color: Colors.blue, size: 18);
      case 'received':
        return const Icon(Icons.arrow_downward, color: Colors.purple, size: 18);
      default:
        return const Icon(Icons.history, color: Colors.grey, size: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      title: 'My Wallet',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Overview
            CustomCard(
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(Icons.account_balance_wallet, color: Colors.white, size: 36),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${walletData['balance']}',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text('IBC Tokens Available', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          formatAddress(walletData['address'] as String),
                          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, size: 16),
                        onPressed: copyAddress,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('${walletData['totalEarned']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          const Text('Total Earned', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('${walletData['totalTransferred']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          const Text('Total Transferred', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: 'Transfer',
                  icon: const Icon(Icons.send, size: 18),
                  outline: true,
                  onPressed: () {}, // TODO: Show transfer dialog
                  height: 40,
                ),
                CustomButton(
                  label: 'Share',
                  icon: const Icon(Icons.share, size: 18),
                  outline: true,
                  onPressed: () {}, // TODO: Share logic
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Co-benefit NFTs
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.auto_awesome, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text('Co-benefit NFTs', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 180),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: coBenefitNFTs.length,
                      itemBuilder: (context, i) {
                        final nft = coBenefitNFTs[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nft['title'] as String? ?? '',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      nft['project'] as String? ?? '',
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Token ${(nft['tokenId'] as String? ?? '')}',
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              CustomBadge(label: nft['mintDate'] as String? ?? '', color: Colors.amber, textStyle: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    label: 'Mint Co-benefit NFT',
                    icon: const Icon(Icons.auto_awesome, size: 18),
                    outline: true,
                    onPressed: () {}, // TODO: Show mint NFT dialog
                    height: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Transaction History
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.history, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Text('Transaction History', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 220),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: transactions.length,
                      separatorBuilder: (context, i) => CustomSeparator(),
                      itemBuilder: (context, idx) {
                        final tx = transactions[idx];
                        return ListTile(
                          leading: getTransactionIcon(tx['type'] as String),
                          title: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  tx['type'] == 'minted'
                                      ? 'Credits Minted'
                                      : tx['type'] == 'transferred'
                                          ? 'Credits Transferred'
                                          : 'Transaction',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: 8),
                              CustomBadge(
                                label: tx['status'] as String? ?? '',
                                color: Colors.green,
                                textStyle: const TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx['type'] == 'minted'
                                    ? (tx['project'] as String? ?? '')
                                    : tx['type'] == 'transferred'
                                        ? 'To ${(tx['recipient'] as String? ?? '')}'
                                        : '',
                                style: const TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                tx['hash'] as String? ?? '',
                                style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${((tx['amount'] ?? 0) as int) > 0 ? '+' : ''}${tx['amount']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ((tx['amount'] ?? 0) as int) > 0 ? Colors.green : Colors.blue,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                tx['date'] as String? ?? '',
                                style: const TextStyle(fontSize: 10, color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Retirement Option
            CustomCard(
              color: Colors.orange[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Retire Credits for Offsetting', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                  const SizedBox(height: 8),
                  const Text('Permanently retire carbon credits to offset your carbon footprint', style: TextStyle(fontSize: 13, color: Colors.orange)),
                  const SizedBox(height: 12),
                  CustomButton(
                    label: 'Retire Tokens',
                    icon: const Icon(Icons.local_fire_department, color: Colors.orange, size: 18),
                    outline: true,
                    onPressed: () {}, // TODO: Retire logic
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/projects');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/collect');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/wallet');
              break;
          }
        },
      ),
    );
  }
}

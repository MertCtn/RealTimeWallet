import 'package:flutter/material.dart';
import 'package:live_wallet/balance_provider.dart';
import 'package:live_wallet/remote_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String userName;

  HomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    if (!balanceProvider.isListening) {
      RemoteData().listenBalance(userName, balanceProvider);
      balanceProvider.setListening(true);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("LiveWallet"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome, $userName!",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                "Your Balance: \$${balanceProvider.balance}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ));
  }
}

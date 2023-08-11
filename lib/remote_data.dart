import 'package:firebase_database/firebase_database.dart';
import 'package:live_wallet/balance_provider.dart';

class RemoteData {
  BalanceProvider balanceProvider = BalanceProvider();

  void listenBalance(String userName, BalanceProvider balanceProvider) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference balanceRef = database.ref(userName);

    balanceRef.onValue.listen((event) {
      final tempBalance = event.snapshot.value;
      double balance = double.parse(tempBalance.toString());
      balanceProvider.updateBalance(balance);
    });
  }
}

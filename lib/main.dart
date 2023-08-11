import 'package:flutter/material.dart';
import 'package:live_wallet/balance_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_wallet/firebase_options.dart';
import 'package:live_wallet/home_page.dart';
import 'package:live_wallet/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BalanceProvider>(
      create: (context) => BalanceProvider(),
      child: MaterialApp(
        title: 'LiveWallet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/home') {
            final String username = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => HomePage(userName: username),
            );
          }
          return null;
        },
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_test/stripe/stripe_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = 'pk_test_51LJESJINsLzJqHMhqtE67EcJtmY2sLrg8EQFj9QfU6Qfvn8rBcr1ZoUKCv16eaW0mASMnim60zajvWmHQ15SzVif00VbdD1Ym6';
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StripeApp(),
    );
  }
}

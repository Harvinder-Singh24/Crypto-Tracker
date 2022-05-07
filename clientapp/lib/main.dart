import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

void main() {
  runApp(const app());
}

// ignore: camel_case_types
class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final paymentItems = <PaymentItem>[];

  @override
  void initState() {
    paymentItems.add(const PaymentItem(
        amount: '1', label: 'Product1', status: PaymentItemStatus.final_price));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: GooglePayButton(
              width: 150,
              height: 60,
              style: GooglePayButtonStyle.white,
              type: GooglePayButtonType.pay,
              paymentConfigurationAsset: 'gpay.json',
              onPaymentResult: (data) {
                print(data);
              },
              paymentItems: paymentItems),
        ),
      ),
    );
  }
}

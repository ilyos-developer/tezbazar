import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/screens/payment_replenishment/pay_bay_body.dart';

import 'card_data_input.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Оплата"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            PayBayBody(
              textCard: "Оплатить через Payme",
              iconUrl: "assets/images/payme.png",
              icon: Icon(Icons.keyboard_arrow_right),
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardDataInput("Оплата"),
                  ),
                );
              },
            ),
            PayBayBody(
              textCard: "Оплатить через Click",
              iconUrl: "assets/images/click.png",
              icon: Icon(Icons.keyboard_arrow_right),
              onTab: () {

              },
            ),
            PayBayBody(
              textCard: "Оплатить наличными",
              iconUrl: "assets/images/pay.png",
              icon: Icon(Icons.keyboard_arrow_right),
              onTab: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

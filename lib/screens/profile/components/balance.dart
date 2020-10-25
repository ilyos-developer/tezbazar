import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/constant.dart';
import 'package:tezbazar/screens/payment_replenishment/card_data_input.dart';
import 'package:tezbazar/screens/payment_replenishment/pay_bay_body.dart';

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Баланс"),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.green[400],
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/purse.png', height: 150),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Текущий баланс",
                      style: TextStyle(color: kTextColor),
                    ),
                    Text(
                      "150 000 сум",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 33),
          PayBayBody(
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDataInput("Пополнение баланса"),
                ),
              );
            },
            iconUrl: "assets/images/payme.png",
            textCard: "Пополнить через Payme",
            icon: Icon(Icons.keyboard_arrow_right),
          ),
          PayBayBody(
            onTab: () {},
            iconUrl: "assets/images/click.png",
            textCard: "Пополнить через Click",
            icon: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezbazar/screens/payment_replenishment/pay_bay_body.dart';
import 'package:tezbazar/screens/payment_replenishment/validate_sms_code.dart';

import '../../constant.dart';

class CardDataInput extends StatefulWidget {
  final String appBarTitle;

  CardDataInput(this.appBarTitle, {Key key}) : super(key: key);

  @override
  _CardDataInputState createState() => _CardDataInputState();
}

class _CardDataInputState extends State<CardDataInput> {
  final fromKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  var sum;
  var numberCard;
  var expirationDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: ListView(
        children: [
          Container(
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PayBayBody(
                      textCard: "Оплата через Payme",
                      iconUrl: "assets/images/payme.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Введите сумму"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Пожалуйста введите сумму";
                        }
                        return null;
                      },
                      onSaved: (value) => sum = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      maxLength: 16,
                      decoration:
                          const InputDecoration(labelText: "Номер карты"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.length != 16) {
                          return "Пожалуйста введите номер карты";
                        }
                        return null;
                      },
                      onSaved: (value) => numberCard = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 200),
                    child: TextFormField(
                      maxLength: 4,
                      decoration:
                          const InputDecoration(labelText: "Срок карты"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.length != 4) {
                          return "Пожалуйста введите срок карты";
                        }
                        return null;
                      },
                      onSaved: (value) => expirationDate = value,
                    ),
                  ),
                  SizedBox(height: 24),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      validateInputs();
                    },
                    child: Text(
                      "Продолжить",
                      style: TextStyle(color: kTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateInputs() {
    if (fromKey.currentState.validate()) {
      fromKey.currentState.save();
      print(numberCard);
      print(sum);
      print(expirationDate);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ValidateCode(appBarTitle: "Подтверждения"),
          ),
        );
        isAutoValidate = true;
      });
    } else {
      //after input, turn on automatic inspection

    }
  }
}

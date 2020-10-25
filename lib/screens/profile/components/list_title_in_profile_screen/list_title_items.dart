import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../constant.dart';
import 'components/about_company.dart';
import 'components/ask_question.dart';
import 'components/confirm_order.dart';
import 'components/delivery_payment.dart';
import 'components/evaluate_app.dart';
import 'components/use_points.dart';

class ListTitleItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Как оформить заказ",
            style: TextStyle(fontFamily: kTextFontFamily),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            "Задать вопрос",
            style: TextStyle(fontFamily: kTextFontFamily),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AskQuestion(),
              ),
            );
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            "Как использовать поинты",
            style: TextStyle(fontFamily: kTextFontFamily),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsePoints(),
              ),
            );
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            "О компании",
            style: TextStyle(fontFamily: kTextFontFamily),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutCompany(),
              ),
            );
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            "Способы доставки и оплаты",
            style: TextStyle(fontFamily: kTextFontFamily),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeliveryAndPayment(),
              ),
            );
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            "Оценить приложение",
            style: TextStyle(fontFamily: kTextFontFamily),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EvaluateApp(),
              ),
            );
          },
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
      ],
    );
  }
}
